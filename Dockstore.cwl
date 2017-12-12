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
  fastqs_in:
    type:
      - 'null'
      - type: array
        items: File
      doc: "Fastq files to verify, can be gzipped."
      inputBinding:
        prefix: -i
        position: 1
        separate: true
        shellQuote: true
  qc_pairs:
    type: int
    doc: "Assess phred quality scale using N pairs (0=all, slow)"
    default: 100000
    inputBinding:
      prefix: -q
      position: 2
      separate: true
  output_fq:
    type: string
    doc: "Not to be overridden by users: Output as interleaved FASTQ (ignored for interleaved input)"
    default: interleaved.fq.gz
    inputBinding:
      prefix: -o
      position: 3
      separate: true

outputs:
  report_json:
    type: File
    outputBinding:
      glob: report.json

  ifastq_out:
    type: ["null", File]
    outputBinding:
      glob: interleaved.fq.gz


baseCommand: ["cgpSeqInputVal", "seq-valid", "-r", "report.json"]

doc: |
    ![build_status](https://quay.io/repository/wtsicgp/dockstore-cgp-seqval/status)
    A Docker container for validating interleaved fastq files.

    See [dockstore-cgp-seqval](https://github.com/cancerit/dockstore-cgp-seqval) website for more information.
