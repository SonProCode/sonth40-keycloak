{{/* Chart name */}}
{{- define "postgresql.fullname" -}}
{{ include "postgresql.name" . }}-svc
{{- end }}


{{/* Name */}}
{{- define "postgresql.name" -}}
{{ default .Chart.Name .Values.nameOverride }}
{{- end }}
