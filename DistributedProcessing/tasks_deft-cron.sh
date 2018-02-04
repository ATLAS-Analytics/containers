apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: tasks-deft-collector
spec:
  schedule: "20 */1 * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: analytics-svc-container
            image: atlasanalyticsservice/containers:latest
            command: ["/run.sh"]
            args: ["/DistributedProcessing/run_tasks_deft.sh"]
            env:
            - name: JOB_ORACLE_USER
              valueFrom:
                secretKeyRef:
                  name: oracle-secret
                  key: job_oracle_user
            - name: JOB_ORACLE_PASS
              valueFrom:
                secretKeyRef:
                  name: oracle-secret
                  key: job_oracle_pass
            - name: JOB_ORACLE_CONNECTION_STRING
              valueFrom:
                secretKeyRef:
                  name: oracle-secret
                  key: job_oracle_connection_string
            volumeMounts:
            - name: keytab-volume
              mountPath: "/tmp/keytab"
              readOnly: true
          volumes:
          - name: keytab-volume
            secret:
              secretName: analytcssvc-keytab
          restartPolicy: Never
