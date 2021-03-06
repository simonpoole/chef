name "draco"
description "Master role applied to draco"

default_attributes(
  :networking => {
    :interfaces => {
      :internal_ipv4 => {
        :interface => "eth0.2801",
        :role => :internal,
        :family => :inet,
        :address => "10.0.0.11"
      },
      :external_ipv4 => {
        :interface => "eth0.2800",
        :role => :external,
        :family => :inet,
        :address => "193.60.236.12"
      }
    }
  },
  :sysctl => {
    :tune_cpu_scheduler => {
      :comment => "Tune CPU scheduler for server scheduling",
      :parameters => {
        "kernel.sched_migration_cost_ns" => 50000000,
        "kernel.sched_autogroup_enabled" => 0
      }
    }
  }
)

run_list(
  "role[ucl]",
  "role[hp-g5]"
)
