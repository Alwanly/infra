# Monitoring Stack

This repository sets up a monitoring stack using Prometheus, Grafana, Node Exporter, and cAdvisor for monitoring system metrics and container performance. The stack is configured using Docker Compose.

**Tools and Services in the Stack:**
1. Prometheus:
- Purpose: Prometheus is an open-source system monitoring and alerting toolkit. It collects and stores metrics as time-series data, providing a powerful query language (PromQL) to query metrics.

- Ports: 9090: Exposes the Prometheus web UI where you can view and query metrics.
- Configuration:
  - The Prometheus configuration file (prometheus.yaml) is mounted into the container as read-only (ro).
  - The persistent volume prometheus-data stores Prometheus data for persistence across container restarts.

2. Grafana: 
- Purpose: Grafana is an open-source analytics and monitoring platform that integrates with various data sources (including Prometheus) and provides beautiful dashboards and visualizations for your metrics.

- Ports: 3000: Exposes the Grafana web UI where you can create dashboards, view metrics, and set up alerts.

- Configuration:
  - The persistent volume grafana-data is used to store Grafana dashboards and other configurations.

3. Node Exporter:
- Purpose: Node Exporter exposes system-level metrics like CPU, memory, disk, network, and filesystem usage. It collects information about the host's hardware and system performance.

- Ports: 9100: Exposes the Node Exporter metrics endpoint.

- Configuration:

  - The --path.rootfs=/host command flag tells Node Exporter to read system data from the /host directory in the container, which is mapped to the host system's root filesystem.

  - Network and PID Namespace: The container uses network_mode: host and pid: host, meaning it shares the network and PID namespaces with the host system, allowing it to access host system metrics directly.

4. cAdvisor:

- Purpose: cAdvisor (Container Advisor) is a tool that provides container performance monitoring and resource usage metrics (CPU, memory, disk, network) for Docker containers.

- Ports: 8080: Exposes the cAdvisor web UI, where you can see the resource usage statistics of your running containers.

- Configuration:
  - The --privileged flag allows cAdvisor to access more low-level system metrics.

  - The container uses several volume mounts to access the host system’s root filesystem, run directories, and Docker container data, allowing it to monitor containers and their resource usage.
