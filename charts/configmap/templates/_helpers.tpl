{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-configmap.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-configmap.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-configmap.labels" -}}
helm.sh/chart: {{ include "k8s-configmap.chart" . }}
{{ include "k8s-configmap.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-configmap.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-configmap.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
