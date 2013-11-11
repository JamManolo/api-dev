#!/bin/csh -f

set echo

rake db:reset

rake db:populate create=league --trace
rake db:populate update=league --trace

rake db:populate create=team --trace
rake db:populate update=team --trace

rake db:populate create=fixture --trace
rake db:populate update=fixture --trace

