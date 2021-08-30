# Storm

This repo contains Storm Helm chart for deploying on Kubernetes.

## Installation

Nodes where Storm needs to be deployed must be labeled. There are four labels namely, `nimbus` for nimbus, `supervisor` for supervisor, `ui` for user interface  
and `zokeeper` for zookeeper. To label node use:

    $ kubectl label nodes node-list nimbus=true supervisor=true ui=true zookeeper=true

Where:

 - `node-list` are nodes to label

To disable node selector just set `nodeselector` for nimbus, supervisor, ui and zookeeper in `values.yaml` to `false`.  
Before installation fill `values.yaml` and to install Helm chart run:

    $ helm install some-chart-name --namespace=some-namespace-name --create-namespace path-to-chart-directory

Where:

- `some-chart-name` is Helm chart name
- `some-namespace-name` is optional argument that defines Kubernetes and Helm namespace where chart will be installed
- `path-to-chart-directory` is chart directory

## Values

Possible values to configure inside `values.yaml` are: 

 - `image` - defines Zookeeper image name
 - `imageTag` - defines Zookeeper image tag
 - `replicas` - defines number of Pods (integer)
 - `serviceName` - defines Kubernetes service name for component
 - `nodeSelector` - defines node selector usage (boolean) and possible values are `true` and `false`
 - `nodePort` - defines service port where service can be accessed outside cluster

`Storage section` enables using costum volume mounts. To use it set `subsection enabled` to `true` and fill `volumeMounts` and `volumes` fields according to Kubernetes documentation.

## Uninstallation

To full uninstall run:

    $ helm del some-chart-name -n some-namespace-name

Where:

- `some-chart-name` is Helm chart name for uninstall.
- `some-namespace-name` is optional argument that defines Helm namespace where chart is installed.