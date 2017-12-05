#!/usr/bin/env cwl-runner

class: CommandLineTool

id: "cgp-seqval"

label: "CGP sequence validator"

cwlVersion: v1.0

dct:creator:
  "@id": "keiranmraine@gmail.com"
  foaf:name: Keiran Raine
  foaf:mbox: "keiranmraine@gmail.com"

requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/wtsicgp/dockstore-cgp-seqval:0.0.0"

inputs:
  in_file:
    type: File
    doc: "Fastq file to verify, can be gzipped."
    inputBinding:
      prefix: -i
      position: 1
      separate: true
      shellQuote: true

outputs:
  report_json:
    type: File
    outputBinding:
      glob: report.json


baseCommand: ["cgpSeqInputVal", "seq-valid", "-r", "report.json"]

doc: |
    ![build_status](https://quay.io/repository/wtsicgp/dockstore-cgp-seqval/status)
    A Docker container for validating interleaved fastq files.

    See [dockstore-cgp-seqval](https://github.com/cancerit/dockstore-cgp-seqval) website for more information.
