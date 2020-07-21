**Local Install Guide**

_Clone to Local_
1. Clone the repository to local - 
```
git@github.com:kayue/github-burndown-chart.git
```
_Create local setup_
1. Install web server and other dependency
Use docker to setup local environment.
 ```
	Download Docker for MAC - https://hub.docker.com/editions/community/docker-ce-desktop-mac/
	More info - https://docs.docker.com/docker-for-mac/install/

```
Project setup
1. Open terminal and navigate to  github-burndown-chart that was cloned earlier.
```
cd github-burndown-chart
```
2. Start docker container
```
docker-compose up -d``````
```
Try 
```
curl localhost:80
```
You can see it returns html content. Subsequently open the browser and enter
```
http://localhost:80
```



	

