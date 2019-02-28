FROM  alpine:3.7

MAINTAINER  keiranmraine@gmail.com

LABEL uk.ac.sanger.cgp="Cancer Genome Project, Wellcome Trust Sanger Institute" \
      version="0.1.1" \
      description="Tool to verify sequencing data integrity"

USER  root

ENV OPT /opt/wtsi-cgp
ENV PATH $OPT/bin:$PATH

RUN apk add --no-cache bash python3 py3-pip

RUN pip3 install https://github.com/cancerit/cgp_seq_input_val/releases/download/1.5.0/cgp_seq_input_val-1.5.0-py3-none-any.whl

RUN addgroup -S cgp && adduser -G cgp -S cgp

USER cgp
WORKDIR /home/cgp

CMD ["/bin/bash"]
