{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-secret.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-secret.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-secret.labels" -}}
helm.sh/chart: {{ include "k8s-secret.chart" . }}
{{ include "k8s-secret.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-secret.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-secret.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
