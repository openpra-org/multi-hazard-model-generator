 G-PWR,  [ssc_name]-SIF-FT =
[ssc_name]-SIF-FT                      AND  SIF-R-[main_room_num]-GT     SIF-R-[diff_room_num]-GT     
SIF-R-[main_room_num]-GT                      AND  SIF-SRC-R-[main_room_num]-GT     [num_ssc_flood]-HRA     
SIF-SRC-R-[main_room_num]-GT                      OR  [ssc_flood_name]-SEIS-FT     
SIF-R-[diff_room_num]-GT                      OR  SIF-R-[diff_room_num]-PRG-GT     BARR-COLL-[ssc_name]-GT     
SIF-R-[diff_room_num]-PRG-GT                      AND  SIF-SRC-R-[diff_room_num]-GT     
SIF-SRC-R-[diff_room_num]-GT                      AND  [ssc_flood_name]-SEIS-FT     [num_ssc_flood]-HRA     
[ssc_flood_name]-SEIS-FT                           TRAN
BARR-COLL-[ssc_name]-GT                      AND  BARR-COLL-R-[main_room_num]-[ssc_name]-GT     BARR-COLL-R-[diff_room_num]-[ssc_name]-GT     
BARR-COLL-R-[main_room_num]-[ssc_name]-GT                      OR  [barrier_mr]-SEIS-FT     [barrier_mr]-PRS-BE     
[barrier_mr]-SEIS-FT                           TRAN
BARR-COLL-R-[diff_room_num]-[ssc_name]-GT                      OR  [barrier_or]-SEIS-FT     [barrier_mr]-PRS-BE     
[barrier_or]-SEIS-FT                           TRAN
