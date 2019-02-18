# dockstore-cgp-seqval

A Docker and Dockstore wrapper for the `cgpSeqInputVal seq-valid` tool from [cgp_seq_input_val](https://github.com/cancerit/cgp_seq_input_val).

[![Docker Repository on Quay](https://quay.io/repository/wtsicgp/dockstore-cgp-seqval/status "Docker Repository on Quay")](https://quay.io/repository/wtsicgp/dockstore-cgp-seqval)

[![Build Status](https://travis-ci.org/cancerit/dockstore-cgp-seqval.svg?branch=master)](https://travis-ci.org/cancerit/dockstore-cgp-seqval) : master
[![Build Status](https://travis-ci.org/cancerit/dockstore-cgp-seqval.svg?branch=develop)](https://travis-ci.org/cancerit/dockstore-cgp-seqval) : develop

## Input and Output

Please see `examples/*.json` for example json files for use with dockstore.

### inputs

* `fastqs_in` - a list of 1 or 2 fastq files to be processed.
* `qc_pairs` - Number of pairs to asses for phred quality range.
  * Defaults to 100,000 (se to 0 for all, very slow)

Other input options defined in the cwl should not be defined in the json file by users.

### outputs

* `report_json` - A json report evaluating the analysis of the `in_file`.
* `ifastq_out` - Path to store interleaved gzip compressed fastq output file.
  * Only generated when input is paired fastq.

## examples

There are two examples included in this repository.

1. `examples/interleaved_fq_in.json`
  * A single interleaved gzip/bzip2 compressed fastq is presented as input.
  * Output is the json report as described [here](https://github.com/cancerit/cgp_seq_input_val#cgpseqinputval-seq-valid).
1. `examples/paired_fq_in.json`
  * A pair if read 1/2 gzip/bzip2 compressed fastq files are presented as input.
  * Output is the json report ___and___ an interleaved gzip compressed fastq file.

Comparing the generated fastq with the input interleaved file using zdiff will report
an exact match (compression may differ slightly so MD5 is not appropriate).

## Development environment

This project uses git pre-commit hooks.  As these will execute on your system you
need to activate them.  Failure to adhere to these may result in rejection of your
work.

You will need to install:

```
gem install --user-install mdl
```

The following command will activate the checks to execute before a commit is processed:

```
git config core.hooksPath git-hooks
```

A failure will block a commit, this includes style for terraform.

You can run the same checks manually without a commit by executing the following
in the base of the clone:

```bash
./run_checks.sh
```

----

```
LICENCE

Copyright (c) 2017 Genome Research Ltd.

Author: Cancer Genome Project <cgpit@sanger.ac.uk>

This file is part of dockstore-cgp-seqval.

dockstore-cgp-seqval is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation; either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

1. The usage of a range of years within a copyright statement contained within
this distribution should be interpreted as being equivalent to a list of years
including the first and last year specified and all consecutive years between
them. For example, a copyright statement that reads ‘Copyright (c) 2005, 2007-
2009, 2011-2012’ should be interpreted as being identical to a statement that
reads ‘Copyright (c) 2005, 2007, 2008, 2009, 2011, 2012’ and a copyright
statement that reads ‘Copyright (c) 2005-2012’ should be interpreted as being
identical to a statement that reads ‘Copyright (c) 2005, 2006, 2007, 2008,
2009, 2010, 2011, 2012’."
```
