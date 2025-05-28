# Define: duplicity::job
#
# This define constructs a schedule job running duplicity
#
# Parameters:
#
#  source:
#    Source location
#
#  destination:
#    Destination location
#
#  options:
#    Options to be passed to duplicity command
#
#  runas:
#    User that should run the job
#
#  minute:
#    Cron time interval
#
#  hour:
#    Cron time interval
#
#  monthday:
#    Cron time interval
#
#  month:
#    Cron time interval
#
#  weekday:
#    Cron time interval
#
# Actions:
#   - Creates a job from the parameters passed
#   - Schedules the job to run based on parameters
#
# Requires:
#
#  EPEL repository
#
# Sample Usage:
#
#  To configure a job, use:
#
#    duplicity::job { 'backup':
#      source      => '/home/source',
#      destination => '/home/destination',
#      runas       => 'deploy',
#      minute      => '0',
#    }
#
define duplicity::job (
  $source = '',
  $destination = '',
  $options = '',
  $runas = '',
  $minute = '',
  $hour = '*',
  $monthday = '*',
  $month = '*',
  $weekday = '*'
) {
  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'duplicity',
  }

  file { "/usr/bin/job-${name}.sh":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('duplicity/job.erb'),
  }

  cron { "duplicity-${name}":
    ensure   => present,
    command  => "/usr/bin/job-${name}.sh > /dev/null 2>&1",
    user     => $runas,
    minute   => $minute,
    hour     => $hour,
    monthday => $monthday,
    month    => $month,
    weekday  => $weekday,
    require  => Package[$depends],
  }

}
