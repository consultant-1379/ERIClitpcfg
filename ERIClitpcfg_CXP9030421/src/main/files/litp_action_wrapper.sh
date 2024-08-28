#!/bin/bash
set -x
[ -f /opt/ericsson/nms/litp/etc/mcollective/mcollective/agent/puppetcache.rb ] && /usr/bin/mco rpc -I $(/bin/hostname) puppetcache clean < /dev/null
[ -f /var/lib/litp/core/maintenance_job_state.txt ] || /usr/bin/systemctl restart litpd.service
/bin/sh /etc/yum/post-actions/puppet_not_running.sh && /usr/bin/systemctl restart puppetserver.service
/usr/bin/mco puppet runall 10
