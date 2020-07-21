_Clone to Local_
_1. Clone the repository to local -_ 
```
git@github.com:wilfi/git-burndown-chart.git
```
_Create local setup_
_1. Install web server and other dependency_
_Use docker to setup local environment._ 

 ```
	Download Docker for MAC - https://hub.docker.com/editions/community/docker-ce-desktop-mac/
	More info - https://docs.docker.com/docker-for-mac/install/

```
_Project setup_
1. Open terminal and navigate to  github-burndown-chart that was cloned earlier.

```
cd github-burndown-chart
```
2. Start docker container

```
docker-compose up -d
```

_Try_ 

```
curl localhost:80
```

_You can see it returns html markup._

_Subsequently open the browser and type_

```
http://localhost:80
```

_Adding Personal Access Token_

For accessing private Github repository, we need to add the Github Personal Access token associated to the user. 

This token should be added to the 

``` token ``` 

key in the file


```
public/config.json
```

_For generating a Github Personal Access Token check here -_ 

https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token 

_Setting up Milestones & Issues_
1. Create a Milestone with estimate end date.
2. Create issues tagged to the Milestone.
3. Create different labels as story points. The label name should be like - 

``` size [number]```

_Example -_ 

``` size 1```  ``` size 2 ``` ``` size 3 ``` ``` size 5 ``` ``` size 8 ```  etc

More reference - https://github.com/wilfi/d8dev
Milestones - https://github.com/wilfi/d8dev/milestone/3

_See the BurnDown in realtime_

```
http://localhost:80/#!/wilfi/d8dev
```

_Now, close some issues from the issue queue - https://github.com/wilfi/d8dev/issues
and reload_ 

```
http://localhost:80/#!/wilfi/d8dev
```

_You should see the updated graph._

_Create new Milestones and issues_
You can create new milestone, set an estimate completion date and tag issues to the milestone.

_Then navigate to_ 

```
http://localhost:80/#!/wilfi/d8dev/[milestone_number]
```

_Example_ 

```
http://localhost/public/#!/wilfi/d8dev/3
```

_Where, ``` 3``` is the milestone number from Github._
https://github.com/wilfi/d8dev/milestone/3
