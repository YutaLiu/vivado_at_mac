#  NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
#  This is an automatically generated file by yuta on 2026年 3月12日 星期四 01時51分16秒 CST
# 
#  cmd:    veer -target=default 
# 
# To use this in a perf script, use 'require $RV_ROOT/configs/config.pl'
# Reference the hash via $config{name}..


%config = (
            'memmap' => {
                          'external_data' => '0xc0580000',
                          'external_data_1' => '0xb0000000',
                          'unused_region1' => '0x60000000',
                          'unused_region0' => '0x70000000',
                          'serialio' => '0xd0580000',
                          'consoleio' => '0xd0580000',
                          'unused_region3' => '0x40000000',
                          'unused_region5' => '0x20000000',
                          'unused_region2' => '0x50000000',
                          'external_mem_hole' => '0x90000000',
                          'unused_region6' => '0x10000000',
                          'unused_region4' => '0x30000000',
                          'debug_sb_mem' => '0xa0580000',
                          'unused_region7' => '0x00000000'
                        },
            'even_odd_trigger_chains' => 'true',
            'perf_events' => [
                               1,
                               2,
                               3,
                               4,
                               5,
                               6,
                               7,
                               8,
                               9,
                               10,
                               11,
                               12,
                               13,
                               14,
                               15,
                               16,
                               17,
                               18,
                               19,
                               20,
                               21,
                               22,
                               23,
                               24,
                               25,
                               26,
                               27,
                               28,
                               29,
                               30,
                               31,
                               32,
                               34,
                               35,
                               36,
                               37,
                               38,
                               39,
                               40,
                               41,
                               42,
                               43,
                               44,
                               45,
                               46,
                               47,
                               48,
                               49,
                               50,
                               51,
                               52,
                               53,
                               54,
                               55,
                               56,
                               512,
                               513,
                               514,
                               515,
                               516
                             ],
            'config_key' => '32\'hdeadbeef',
            'target' => 'default',
            'harts' => 1,
            'dccm' => {
                        'dccm_num_banks' => '8',
                        'dccm_fdata_width' => 39,
                        'dccm_index_bits' => 11,
                        'dccm_region' => '0xf',
                        'dccm_rows' => '2048',
                        'dccm_eadr' => '0xf004ffff',
                        'dccm_offset' => '0x40000',
                        'dccm_enable' => 1,
                        'dccm_reserved' => '0x2004',
                        'lsu_sb_bits' => 16,
                        'dccm_byte_width' => '4',
                        'dccm_sadr' => '0xf0040000',
                        'dccm_bank_bits' => 3,
                        'dccm_num_banks_8' => '',
                        'dccm_width_bits' => 2,
                        'dccm_data_cell' => 'ram_2048x39',
                        'dccm_bits' => 16,
                        'dccm_ecc_width' => 7,
                        'dccm_size_64' => '',
                        'dccm_data_width' => 32,
                        'dccm_size' => 64
                      },
            'max_mmode_perf_event' => '516',
            'bht' => {
                       'bht_ghr_pad' => 'fghr[2:0],3\'b0',
                       'bht_addr_lo' => '3',
                       'bht_addr_hi' => 9,
                       'bht_size' => 512,
                       'bht_ghr_size' => 7,
                       'bht_ghr_range' => '6:0',
                       'bht_ghr_pad2' => 'fghr[3:0],2\'b0',
                       'bht_ghr_hash_1' => '',
                       'bht_array_depth' => 128,
                       'bht_hash_string' => 0
                     },
            'csr' => {
                       'mhpmevent5' => {
                                         'mask' => '0xffffffff',
                                         'exists' => 'true',
                                         'reset' => '0x0'
                                       },
                       'mhpmcounter5' => {
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff',
                                           'exists' => 'true'
                                         },
                       'dcsr' => {
                                   'poke_mask' => '0x00008dcc',
                                   'mask' => '0x00008c04',
                                   'exists' => 'true',
                                   'debug' => 'true',
                                   'reset' => '0x40000003'
                                 },
                       'mcounteren' => {
                                         'exists' => 'false'
                                       },
                       'pmpaddr2' => {
                                       'exists' => 'false'
                                     },
                       'mrac' => {
                                   'reset' => '0x0',
                                   'exists' => 'true',
                                   'shared' => 'true',
                                   'mask' => '0xffffffff',
                                   'comment' => 'Memory region io and cache control.',
                                   'number' => '0x7c0'
                                 },
                       'pmpcfg3' => {
                                      'exists' => 'false'
                                    },
                       'mhpmcounter6h' => {
                                            'reset' => '0x0',
                                            'exists' => 'true',
                                            'mask' => '0xffffffff'
                                          },
                       'time' => {
                                   'exists' => 'false'
                                 },
                       'mcpc' => {
                                   'reset' => '0x0',
                                   'mask' => '0x0',
                                   'comment' => 'Core pause',
                                   'number' => '0x7c2',
                                   'exists' => 'true'
                                 },
                       'cycle' => {
                                    'exists' => 'false'
                                  },
                       'mscause' => {
                                      'mask' => '0x0000000f',
                                      'exists' => 'true',
                                      'number' => '0x7ff',
                                      'reset' => '0x0'
                                    },
                       'mhpmcounter3' => {
                                           'exists' => 'true',
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0'
                                         },
                       'pmpaddr0' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr11' => {
                                        'exists' => 'false'
                                      },
                       'dicago' => {
                                     'debug' => 'true',
                                     'mask' => '0x0',
                                     'comment' => 'Cache diagnostics.',
                                     'number' => '0x7cb',
                                     'reset' => '0x0',
                                     'exists' => 'true'
                                   },
                       'mpmc' => {
                                   'number' => '0x7c6',
                                   'exists' => 'true',
                                   'mask' => '0x2',
                                   'reset' => '0x2'
                                 },
                       'pmpaddr8' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr14' => {
                                        'exists' => 'false'
                                      },
                       'mitctl1' => {
                                      'mask' => '0x0000000f',
                                      'number' => '0x7d7',
                                      'exists' => 'true',
                                      'reset' => '0x1'
                                    },
                       'pmpaddr6' => {
                                       'exists' => 'false'
                                     },
                       'mitbnd1' => {
                                      'reset' => '0xffffffff',
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d6',
                                      'exists' => 'true'
                                    },
                       'marchid' => {
                                      'exists' => 'true',
                                      'mask' => '0x0',
                                      'reset' => '0x00000011'
                                    },
                       'mitcnt0' => {
                                      'reset' => '0x0',
                                      'mask' => '0xffffffff',
                                      'exists' => 'true',
                                      'number' => '0x7d2'
                                    },
                       'miccmect' => {
                                       'exists' => 'true',
                                       'number' => '0x7f1',
                                       'mask' => '0xffffffff',
                                       'reset' => '0x0'
                                     },
                       'mie' => {
                                  'mask' => '0x70000888',
                                  'exists' => 'true',
                                  'reset' => '0x0'
                                },
                       'mdccmect' => {
                                       'reset' => '0x0',
                                       'mask' => '0xffffffff',
                                       'exists' => 'true',
                                       'number' => '0x7f2'
                                     },
                       'mhpmevent3' => {
                                         'exists' => 'true',
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0'
                                       },
                       'pmpaddr3' => {
                                       'exists' => 'false'
                                     },
                       'dicawics' => {
                                       'mask' => '0x0130fffc',
                                       'comment' => 'Cache diagnostics.',
                                       'number' => '0x7c8',
                                       'debug' => 'true',
                                       'exists' => 'true',
                                       'reset' => '0x0'
                                     },
                       'pmpaddr13' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg1' => {
                                      'exists' => 'false'
                                    },
                       'mhpmcounter4' => {
                                           'reset' => '0x0',
                                           'exists' => 'true',
                                           'mask' => '0xffffffff'
                                         },
                       'pmpaddr10' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr9' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr4' => {
                                       'exists' => 'false'
                                     },
                       'mhartid' => {
                                      'poke_mask' => '0xfffffff0',
                                      'exists' => 'true',
                                      'mask' => '0x0',
                                      'reset' => '0x0'
                                    },
                       'pmpcfg0' => {
                                      'exists' => 'false'
                                    },
                       'mhartstart' => {
                                         'comment' => 'Hart start mask',
                                         'mask' => '0x0',
                                         'number' => '0x7fc',
                                         'exists' => 'true',
                                         'shared' => 'true',
                                         'reset' => '0x1'
                                       },
                       'meipt' => {
                                    'number' => '0xbc9',
                                    'exists' => 'true',
                                    'mask' => '0xf',
                                    'comment' => 'External interrupt priority threshold.',
                                    'reset' => '0x0'
                                  },
                       'mitcnt1' => {
                                      'number' => '0x7d5',
                                      'exists' => 'true',
                                      'mask' => '0xffffffff',
                                      'reset' => '0x0'
                                    },
                       'mfdht' => {
                                    'mask' => '0x0000003f',
                                    'comment' => 'Force Debug Halt Threshold',
                                    'number' => '0x7ce',
                                    'reset' => '0x0',
                                    'exists' => 'true',
                                    'shared' => 'true'
                                  },
                       'instret' => {
                                      'exists' => 'false'
                                    },
                       'mitbnd0' => {
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d3',
                                      'exists' => 'true',
                                      'reset' => '0xffffffff'
                                    },
                       'pmpaddr5' => {
                                       'exists' => 'false'
                                     },
                       'mhpmevent6' => {
                                         'mask' => '0xffffffff',
                                         'exists' => 'true',
                                         'reset' => '0x0'
                                       },
                       'dicad0' => {
                                     'reset' => '0x0',
                                     'exists' => 'true',
                                     'debug' => 'true',
                                     'number' => '0x7c9',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0xffffffff'
                                   },
                       'tselect' => {
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'mask' => '0x3'
                                    },
                       'mhpmcounter4h' => {
                                            'mask' => '0xffffffff',
                                            'exists' => 'true',
                                            'reset' => '0x0'
                                          },
                       'pmpaddr12' => {
                                        'exists' => 'false'
                                      },
                       'mhartnum' => {
                                       'shared' => 'true',
                                       'exists' => 'true',
                                       'reset' => '0x1',
                                       'number' => '0xfc4',
                                       'mask' => '0x0',
                                       'comment' => 'Hart count'
                                     },
                       'mfdc' => {
                                   'shared' => 'true',
                                   'exists' => 'true',
                                   'number' => '0x7f9',
                                   'mask' => '0x00071f4d',
                                   'reset' => '0x00070040'
                                 },
                       'mfdhs' => {
                                    'number' => '0x7cf',
                                    'exists' => 'true',
                                    'mask' => '0x00000003',
                                    'comment' => 'Force Debug Halt Status',
                                    'reset' => '0x0'
                                  },
                       'mitctl0' => {
                                      'reset' => '0x1',
                                      'mask' => '0x00000007',
                                      'number' => '0x7d4',
                                      'exists' => 'true'
                                    },
                       'pmpaddr7' => {
                                       'exists' => 'false'
                                     },
                       'mnmipdel' => {
                                       'number' => '0x7fe',
                                       'mask' => '0x1',
                                       'comment' => 'NMI pin delegation',
                                       'exists' => 'true',
                                       'shared' => 'true',
                                       'reset' => '0x1'
                                     },
                       'micect' => {
                                     'reset' => '0x0',
                                     'exists' => 'true',
                                     'number' => '0x7f0',
                                     'mask' => '0xffffffff'
                                   },
                       'meicurpl' => {
                                       'reset' => '0x0',
                                       'comment' => 'External interrupt current priority level.',
                                       'mask' => '0xf',
                                       'exists' => 'true',
                                       'number' => '0xbcc'
                                     },
                       'mcountinhibit' => {
                                            'reset' => '0x0',
                                            'commnet' => 'Performance counter inhibit. One bit per counter.',
                                            'poke_mask' => '0x7d',
                                            'exists' => 'true',
                                            'mask' => '0x7d'
                                          },
                       'mvendorid' => {
                                        'reset' => '0x45',
                                        'exists' => 'true',
                                        'mask' => '0x0'
                                      },
                       'mcgc' => {
                                   'exists' => 'true',
                                   'shared' => 'true',
                                   'reset' => '0x200',
                                   'poke_mask' => '0x000003ff',
                                   'number' => '0x7f8',
                                   'mask' => '0x000003ff'
                                 },
                       'dmst' => {
                                   'exists' => 'true',
                                   'reset' => '0x0',
                                   'number' => '0x7c4',
                                   'mask' => '0x0',
                                   'comment' => 'Memory synch trigger: Flush caches in debug mode.',
                                   'debug' => 'true'
                                 },
                       'mhpmcounter5h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'mimpid' => {
                                     'reset' => '0x3',
                                     'exists' => 'true',
                                     'mask' => '0x0'
                                   },
                       'pmpaddr1' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter6' => {
                                           'reset' => '0x0',
                                           'exists' => 'true',
                                           'mask' => '0xffffffff'
                                         },
                       'misa' => {
                                   'mask' => '0x0',
                                   'exists' => 'true',
                                   'reset' => '0x40001105'
                                 },
                       'pmpaddr15' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg2' => {
                                      'exists' => 'false'
                                    },
                       'meicidpl' => {
                                       'reset' => '0x0',
                                       'exists' => 'true',
                                       'number' => '0xbcb',
                                       'mask' => '0xf',
                                       'comment' => 'External interrupt claim id priority level.'
                                     },
                       'mhpmcounter3h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'mstatus' => {
                                      'mask' => '0x88',
                                      'exists' => 'true',
                                      'reset' => '0x1800'
                                    },
                       'mhpmevent4' => {
                                         'exists' => 'true',
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0'
                                       },
                       'mip' => {
                                  'reset' => '0x0',
                                  'poke_mask' => '0x70000888',
                                  'exists' => 'true',
                                  'mask' => '0x0'
                                },
                       'dicad1' => {
                                     'debug' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0x3',
                                     'number' => '0x7ca',
                                     'reset' => '0x0',
                                     'exists' => 'true'
                                   }
                     },
            'physical' => '1',
            'xlen' => 32,
            'tec_rv_icg' => 'clockhdr',
            'iccm' => {
                        'iccm_size' => 64,
                        'iccm_size_64' => '',
                        'iccm_bits' => 16,
                        'iccm_num_banks_4' => '',
                        'iccm_data_cell' => 'ram_4096x39',
                        'iccm_bank_bits' => 2,
                        'iccm_bank_hi' => 3,
                        'iccm_sadr' => '0xee000000',
                        'iccm_reserved' => '0x1000',
                        'iccm_offset' => '0xe000000',
                        'iccm_bank_index_lo' => 4,
                        'iccm_enable' => 1,
                        'iccm_region' => '0xe',
                        'iccm_eadr' => '0xee00ffff',
                        'iccm_rows' => '4096',
                        'iccm_index_bits' => 12,
                        'iccm_num_banks' => '4'
                      },
            'retstack' => {
                            'ret_stack_size' => '4'
                          },
            'core' => {
                        'dma_buf_depth' => '5',
                        'lsu_stbuf_depth' => '10',
                        'timer_legal_en' => '1',
                        'iccm_icache' => 1,
                        'atomic_enable' => '1',
                        'icache_only' => 'derived',
                        'bitmanip_zbr' => 0,
                        'iccm_only' => 'derived',
                        'fpga_optimize' => 1,
                        'bitmanip_zbf' => 0,
                        'lsu_num_nbload_width' => '3',
                        'lsu_num_nbload' => '8',
                        'fast_interrupt_redirect' => '1',
                        'bitmanip_zbe' => 0,
                        'bitmanip_zbp' => 0,
                        'div_new' => 1,
                        'bitmanip_zbb' => 1,
                        'div_bit' => '4',
                        'num_threads' => 1,
                        'bitmanip_zbs' => 1,
                        'bitmanip_zbc' => 1,
                        'bitmanip_zba' => 1,
                        'no_iccm_no_icache' => 'derived'
                      },
            'reset_vec' => '0x80000000',
            'num_mmode_perf_regs' => '4',
            'testbench' => {
                             'clock_period' => '100',
                             'lderr_rollback' => '1',
                             'SDVT_AHB' => '1',
                             'sterr_rollback' => '0',
                             'RV_TOP' => '`TOP.rvtop',
                             'assert_on' => '',
                             'CPU_TOP' => '`RV_TOP.veer',
                             'datawidth' => '64',
                             'build_axi_native' => 1,
                             'ext_addrwidth' => '32',
                             'ext_datawidth' => '64',
                             'build_axi4' => 1,
                             'TOP' => 'tb_top'
                           },
            'btb' => {
                       'btb_btag_size' => 5,
                       'btb_index3_hi' => 23,
                       'btb_btag_fold' => 0,
                       'btb_bypass_enable' => '1',
                       'btb_index2_hi' => 16,
                       'btb_size' => 512,
                       'btb_index1_lo' => '3',
                       'btb_addr_lo' => '3',
                       'btb_use_sram' => '0',
                       'btb_index1_hi' => 9,
                       'btb_toffset_size' => '12',
                       'btb_index2_lo' => 10,
                       'btb_array_depth' => 128,
                       'btb_num_bypass' => '8',
                       'btb_addr_hi' => 9,
                       'btb_num_bypass_width' => 4,
                       'btb_fold2_index_hash' => 0,
                       'btb_index3_lo' => 17
                     },
            'bus' => {
                       'lsu_bus_prty' => '2',
                       'sb_bus_prty' => '2',
                       'ifu_bus_tag' => '4',
                       'sb_bus_id' => '1',
                       'ifu_bus_id' => '1',
                       'ifu_bus_prty' => '2',
                       'lsu_bus_tag' => '4',
                       'lsu_bus_id' => '1',
                       'dma_bus_id' => '1',
                       'bus_prty_default' => '3',
                       'dma_bus_tag' => '1',
                       'sb_bus_tag' => '1',
                       'dma_bus_prty' => '2'
                     },
            'pic' => {
                       'pic_meip_mask' => '0x0',
                       'pic_total_int_plus1' => 128,
                       'pic_bits' => 15,
                       'pic_meitp_count' => 4,
                       'pic_2cycle' => '1',
                       'pic_meigwclr_offset' => '0x5000',
                       'pic_meigwctrl_offset' => '0x4000',
                       'pic_meie_mask' => '0x1',
                       'pic_meigwclr_count' => 127,
                       'pic_mpiccfg_mask' => '0x1',
                       'pic_mpiccfg_count' => 1,
                       'pic_meip_offset' => '0x1000',
                       'pic_meip_count' => 4,
                       'pic_total_int' => 127,
                       'pic_meipl_count' => 127,
                       'pic_meigwctrl_count' => 127,
                       'pic_meigwclr_mask' => '0x0',
                       'pic_meie_count' => 127,
                       'pic_meie_offset' => '0x2000',
                       'pic_size' => 32,
                       'pic_mpiccfg_offset' => '0x3000',
                       'pic_offset' => '0xc0000',
                       'pic_int_words' => 4,
                       'pic_meipl_offset' => '0x0000',
                       'pic_base_addr' => '0xf00c0000',
                       'pic_meidels_count' => 127,
                       'pic_meidels_mask' => '0x1',
                       'pic_meitp_mask' => '0x0',
                       'pic_region' => '0xf',
                       'pic_meitp_offset' => '0x1800',
                       'pic_meigwctrl_mask' => '0x3',
                       'pic_meipl_mask' => '0xf'
                     },
            'numiregs' => '32',
            'triggers' => [
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            },
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081810c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'poke_mask' => [
                                               '0x081810c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            },
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ]
                            },
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081810c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'poke_mask' => [
                                               '0x081810c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            }
                          ],
            'target_default' => '1',
            'icache' => {
                          'icache_tag_lo' => 13,
                          'icache_data_index_lo' => 4,
                          'icache_tag_cell' => 'ram_128x25',
                          'icache_beat_bits' => 3,
                          'icache_num_lines_bank' => '64',
                          'icache_num_bypass_width' => 3,
                          'icache_size' => 32,
                          'icache_data_width' => 64,
                          'icache_enable' => 1,
                          'icache_tag_index_lo' => '6',
                          'icache_bypass_enable' => '1',
                          'icache_tag_bypass_enable' => '1',
                          'icache_num_lines_way' => '128',
                          'icache_num_bypass' => '4',
                          'icache_status_bits' => 3,
                          'icache_data_cell' => 'ram_512x71',
                          'icache_tag_depth' => 128,
                          'icache_bank_width' => 8,
                          'icache_bank_hi' => 3,
                          'icache_ecc' => '1',
                          'icache_ln_sz' => 64,
                          'icache_banks_way' => 2,
                          'icache_tag_num_bypass_width' => 2,
                          'icache_num_ways' => 4,
                          'icache_scnd_last' => 6,
                          'icache_beat_addr_hi' => 5,
                          'icache_bank_lo' => 3,
                          'icache_fdata_width' => 71,
                          'icache_data_depth' => '512',
                          'icache_index_hi' => 12,
                          'icache_bank_bits' => 1,
                          'icache_tag_num_bypass' => '2',
                          'icache_2banks' => '1',
                          'icache_num_beats' => 8,
                          'icache_waypack' => '1',
                          'icache_num_lines' => 512
                        },
            'nmi_vec' => '0x11110000',
            'regwidth' => '32',
            'protection' => {
                              'data_access_enable0' => '1',
                              'data_access_enable6' => '0x0',
                              'inst_access_enable2' => '1',
                              'data_access_mask2' => '0x1fffffff',
                              'inst_access_addr7' => '0x00000000',
                              'data_access_addr1' => '0xc0000000',
                              'inst_access_mask6' => '0xffffffff',
                              'data_access_addr5' => '0x00000000',
                              'data_access_enable5' => '0x0',
                              'data_access_addr0' => '0x0',
                              'inst_access_mask4' => '0xffffffff',
                              'data_access_mask3' => '0x0fffffff',
                              'inst_access_enable0' => '1',
                              'inst_access_enable6' => '0x0',
                              'data_access_enable2' => '1',
                              'inst_access_mask2' => '0x1fffffff',
                              'data_access_mask6' => '0xffffffff',
                              'data_access_addr7' => '0x00000000',
                              'inst_access_addr1' => '0xc0000000',
                              'inst_access_addr0' => '0x0',
                              'inst_access_enable5' => '0x0',
                              'inst_access_addr5' => '0x00000000',
                              'data_access_mask4' => '0xffffffff',
                              'inst_access_mask3' => '0x0fffffff',
                              'data_access_mask7' => '0xffffffff',
                              'inst_access_enable7' => '0x0',
                              'inst_access_mask1' => '0x3fffffff',
                              'data_access_addr6' => '0x00000000',
                              'inst_access_enable3' => '1',
                              'inst_access_addr2' => '0xa0000000',
                              'inst_access_addr3' => '0x80000000',
                              'data_access_enable1' => '1',
                              'inst_access_enable4' => '0x0',
                              'data_access_addr4' => '0x00000000',
                              'inst_access_mask0' => '0x7fffffff',
                              'inst_access_mask5' => '0xffffffff',
                              'data_access_enable7' => '0x0',
                              'inst_access_mask7' => '0xffffffff',
                              'data_access_mask1' => '0x3fffffff',
                              'inst_access_addr6' => '0x00000000',
                              'data_access_addr2' => '0xa0000000',
                              'data_access_enable3' => '1',
                              'data_access_addr3' => '0x80000000',
                              'inst_access_enable1' => '1',
                              'inst_access_addr4' => '0x00000000',
                              'data_access_enable4' => '0x0',
                              'data_access_mask5' => '0xffffffff',
                              'data_access_mask0' => '0x7fffffff'
                            }
          );
1;
