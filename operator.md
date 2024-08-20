## Kubernetes Unleash Instance

Unleash is a powerful feature toggling tool that is used to enable or disable features in your application dynamically. This Terraform module manages the deployment of an Unleash instance within a Kubernetes cluster.

### Design Decisions

- **Artifact Endpoint**: The internal API endpoint for the Unleash instance is exposed within the Kubernetes cluster.
- **Helm Provider**: Utilizes the Helm provider to manage the deployment of Unleash.
- **Kubernetes Authentication**: Derived from the Kubernetes cluster's authentication data.
- **Database Configuration**: The Unleash instance is configured to connect to a PostgreSQL database using provided authentication details.
- **Resource Management**: Configurable resource requests and limits, with optional autoscaling support.
- **Ingress Management**: Ingress settings are configurable with options for custom hostnames, paths, and TLS settings.

## Runbook

### Checking Pod Status

To verify that the Unleash pods are running correctly within the Kubernetes cluster:

```sh
kubectl get pods -n <namespace> -l app=unleash
```

The output should list the Unleash pods with their status, ensuring they are in the `Running` state.

### Inspecting Logs

If there are any issues with the Unleash application, you can inspect the logs for more details:

```sh
kubectl logs -n <namespace> <unleash-pod-name>
```

Replace `<unleash-pod-name>` with the actual name of the pod.

### Debugging Ingress

If you are encountering issues accessing the Unleash instance through the ingress:

```sh
kubectl describe ingress -n <namespace> <ingress-name>
```

Look for any error messages or misconfigurations in the described output.

### Verifying Database Connection

To ensure that the Unleash instance can connect to the PostgreSQL database, you can use the following PostgreSQL command-line snippet:

```sh
psql -h <db-host> -U <db-user> -d <db-name> -c '\l'
```

Replace `<db-host>`, `<db-user>`, and `<db-name>` with the appropriate values. This command lists all databases to check connectivity.

### Checking Helm Release

To verify the status of the Helm release managing the Unleash deployment:

```sh
helm status <release-name> -n <namespace>
```

This command will provide the status of the Helm release, exposing any potential issues with the deployment.

### Restarting Unleash Pods

If you need to restart the Unleash pods, you can delete them and Kubernetes will automatically recreate them:

```sh
kubectl delete pod -n <namespace> -l app=unleash
```

This command will delete all pods with the label `app=unleash` in the specified namespace, forcing them to restart.

