{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-pvc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-pvc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-pvc.labels" -}}
helm.sh/chart: {{ include "k8s-pvc.chart" . }}
{{ include "k8s-pvc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-pvc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-pvc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
