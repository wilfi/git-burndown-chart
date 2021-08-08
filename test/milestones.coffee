#!/usr/bin/env coffee
proxy  = do require('proxyquire').noCallThru
assert = require 'assert'
path   = require 'path'

req = {}

milestones = proxy path.resolve(__dirname, '../src/modules/milestones.coffee'),
    './request': req
    './require':
        '_': require 'lodash'
        'superagent': null
        'd3': null
        'async': null
        'marked': require 'marked'

module.exports =

    'milestones - get current from 1': (done) ->
        req.all_milestones = (opts, cb) ->
            cb null, [
                {
                    'number': 1
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-02-01T00:00:00Z'
                }
            ]

        milestones {}, (err, warn, milestone) ->
            assert.ifError err
            assert.equal milestone.number, 1
            do done

    'milestones - get current from 1 when milestone has no due date': (done) ->
        req.all_milestones = (opts, cb) ->
            cb null, [
                {
                    'number': 1
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': null
                }
            ]

        milestones {}, (err, warn, milestone) ->
            assert.ifError err
            assert.equal milestone.number, 1
            do done

    # We always take from head because of request params.
    'milestones - get current from > 1': (done) ->
        req.all_milestones = (opts, cb) ->
            cb null, [
                {
                    'number': 2
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-01-15T00:00:00Z'
                }
                {
                    'number': 1
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-02-01T00:00:00Z'
                }
                {
                    'number': 3
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-02-15T00:00:00Z'
                }
            ]

        milestones {}, (err, warn, milestone) ->
            assert.ifError err
            assert.equal milestone.number, 2
            do done

    'milestones - get current from > 1 when there are milestones without due date': (done) ->
        req.all_milestones = (opts, cb) ->
            cb null, [
                {
                    'number': 2
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': null
                }
                {
                    'number': 1
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-02-01T00:00:00Z'
                }
                {
                    'number': 3
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-02-15T00:00:00Z'
                }
            ]

        milestones {}, (err, warn, milestone) ->
            assert.ifError err
            assert.equal milestone.number, 1
            do done

    'milestones - get current when empty': (done) ->
        req.all_milestones = (opts, cb) ->
            cb null, []

        milestones { 'path': 'some/repo' }, (err, warn, milestone) ->
            assert.ifError err
            assert.equal warn, 'No open milestones for repo some/repo'
            do done

    'milestones - get current when not found': (done) ->
        req.all_milestones = (opts, cb) ->
            cb 'Not Found'

        milestones {}, (err, warn, milestone) ->
            assert.equal err, 'Not Found'
            do done

    'milestones - get current when no issues': (done) ->
        req.all_milestones = (opts, cb) ->
            cb null, [
                {
                    'title': 'No issues'
                    'number': 1
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-02-01T00:00:00Z',
                    'open_issues': 0,
                    'closed_issues': 0
                }
            ]

        milestones {}, (err, warn, milestone) ->
            assert.ifError err
            assert.equal warn, 'No issues for milestone `No issues`'
            do done

    'milestones - get one': (done) ->
        m =
            'number': 1
            'created_at': '2013-01-01T00:00:00Z'
            'due_on': '2013-02-01T00:00:00Z'

        req.one_milestone = (opts, number, cb) ->
            cb null, m

        milestones { 'milestone': 1 }, (err, warn, milestone) ->
            assert.ifError err
            assert.equal warn, null
            assert.deepEqual milestone, m
            do done

    'milestones - get one (404)': (done) ->
        req.one_milestone = (opts, number, cb) ->
            cb 'Not Found'

        milestones { 'milestone': 9 }, (err, warn, milestone) ->
            assert.equal err, 'Not Found'
            do done

    'milestones - get one when no issues': (done) ->
        req.one_milestone = (opts, number, cb) ->
            cb null, {
                'title': 'No issues'
                'number': 1
                'created_at': '2013-01-01T00:00:00Z'
                'due_on': '2013-02-01T00:00:00Z',
                'open_issues': 0,
                'closed_issues': 0
            }

        milestones { 'milestone': 9 }, (err, warn, milestone) ->
            assert.ifError err
            assert.equal warn, 'No issues for milestone `No issues`'
            do done

    'milestones - has description': (done) ->
        req.all_milestones = (opts, cb) ->
            cb null, [
                {
                    'number': 1
                    'created_at': '2013-01-01T00:00:00Z'
                    'due_on': '2013-02-01T00:00:00Z'
                    'description': 'A description of this <strong>milestone</strong> goes *here*'
                }
            ]

        milestones {}, (err, warn, milestone) ->
            assert.ifError err
            assert.equal milestone.description, 'A description of this <strong>milestone</strong> goes <em>here</em>'
            do done