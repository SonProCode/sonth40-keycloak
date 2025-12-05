{{/* Chart name */}}
{{- define "postgresql.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{/* Full name */}}
{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "postgresql.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Common labels */}}
{{- define "postgresql.labels" -}}
app.kubernetes.io/name: {{ include "postgresql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/* Selector labels */}}
{{- define "postgresql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postgresql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* ServiceAccount Name */}}
{{- define "postgresql.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "postgresql.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}
