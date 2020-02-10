FROM ruby:2.6.5
  
RUN git clone https://github.com/oracle/truffleruby.git
WORKDIR truffleruby

RUN echo -e '#!/bin/bash\n/usr/local/bin/ruby /truffleruby/tool/jt.rb' > /usr/bin/jt && \
    chmod +x /usr/bin/jt

RUN ruby tool/jt.rb build --env native

RUN ls -l mxbuild/truffleruby-native
RUN ls -l mxbuild/truffleruby-native/bin
RUN ruby tool/jt.rb --use native ruby --version
