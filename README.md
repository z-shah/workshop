## WORKSHOP ##

1. Create Network

    NOTE: Create tfvars file for variables or pass them at runtime.

    ```
    cd env-setup/terraform/network-cluster

    terraform apply --auto-approve

    ```


1. Create GKE clusters

    NOTE: Create tfvars file for variables or pass them at runtime.

* Dev Cluster: 

    ```
    cd env-setup/terraform/dev-cluster

    terraform apply --auto-approve

    ```

* Prod Cluster

    ```
    cd env-setup/terraform/prod-cluster

    terraform apply --auto-approve

    ```

3. Build and Deploy app

    ```
    cd demos

    ```