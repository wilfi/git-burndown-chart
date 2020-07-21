_Clone to Local_

_1. Clone the repository to local -_ 
```
git clone git@github.com:wilfi/git-burndown-chart.git
```
_Create local setup_
_1. Install web server and other dependency_
_Use docker to setup local environment._ 

 ```
Download Docker for MAC - https://hub.docker.com/editions/community/docker-ce-desktop-mac/
More info - https://docs.docker.com/docker-for-mac/install/

```
_Project setup_

_1. Open terminal and navigate to  github-burndown-chart that was cloned earlier._

```
cd github-burndown-chart
```
_2. Start docker container_

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

_For accessing private Github repository, we need to add the Github Personal Access token associated to the user._ 

_This token should be added to the_ 

``` token ``` 

_key in the file_


```
public/config.json
```

_For generating a Github Personal Access Token check here -_ 

https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token 

_Setting up Milestones & Issues_
_1. Create a Milestone with estimate end date._
_2. Create issues tagged to the Milestone._
_3. Create different labels as story points. The label name should be like -_ 

``` size [number]```

_Example -_ 

``` size 1```  ``` size 2 ``` ``` size 3 ``` ``` size 5 ``` ``` size 8 ```  etc

_More reference_ - https://github.com/wilfi/d8dev

_Milestones_ - https://github.com/wilfi/d8dev/milestone/3

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
_You can create new milestones, set an estimate completion date and tag issues to the milestone._

_Then navigate to_ 

```
http://localhost:80/#!/wilfi/d8dev/[milestone_number]
```

_Example_ 

```
http://localhost:80/public/#!/wilfi/d8dev/3
```

_Where, ``` 3``` is the milestone number from Github._

```
https://github.com/wilfi/d8dev/milestone/3
```

_Any private repository with Milestones & issues with story point defined like above can be viewed by navigating to_ 

```
http://localhost:80/public/#!/[usernameoraccountname]/[repositoryname]/[milestone_number]
```