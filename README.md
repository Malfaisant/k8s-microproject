## Steps

### Initial project setup

1. Clone this repository

```bash
git clone git@github.com:nas-tabchiche/sample-express.git
```

2. Create your own repository on Github

3. Change the repote to your repository

```bash
git remote set-url origin git@github.com:<github-username>/<repo-name>.git
```

### Dockerize and publish the image

1. Write a Dockerfile

2. Build your image with the `sample-express` tag

```bash
docker build . -t <username>/sample-express
```

3. Publish the image on dockerhub

```bash
docker push <username>/sample-express
```

### Create and expose your first deployment

1. Write a `deployment.yaml` file containing the information about your deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sample-express-deployment
spec:
  ...
```

2. Write a `service.yaml`fiel containing the information about your service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: sample-express-service
spec:
```

3. Apply your deployment and service

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

4. Check that your pods are running

```bash
kubectl get pods
```

> [!NOTE]
> Their status should be 'Running'. It might take a few seconds to get there.

5. Access your application
