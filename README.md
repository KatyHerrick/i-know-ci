# I Know CI

An example CI pipeline to deploy a React app running in a Docker container to AWS EBS using Travis CI.

## Running Locally
To run using the development server, run:
```
docker-compose up
```
Source code changes will be reflected at [localhost:3000](http://localhost:3000) automatically.

### Running Tests
The tests will run in a separate container while running `docker-compose up`.

## Running Production Mode
To run the production build with an nginx server locally, run:
```
docker build .
>> Copy resulting [image_id]
docker run -p 8080:80 [image_id]
```
The app will be available at [localhost:8080](http://localhost:8080).

---

The unremarkable `/src` code is the default output of [Create React App](https://github.com/facebook/create-react-app).