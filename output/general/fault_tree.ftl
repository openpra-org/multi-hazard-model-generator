G-PWR,   MDP-A-MS-FT = 
MDP-A-MS-FT            OR  MDP-A-MS-1-GT  MDP-A-MS-2-GT  MDP-A-MS-3-GT  MDP-A-MS-4-GT  MDP-A-MS-5-GT  MDP-A-MS-6-GT  MDP-A-MS-7-GT  
MDP-A-MS-1-GT            AND  HE-MS-1   MDP-A-MS-1  
MDP-A-MS-2-GT            AND  HE-MS-2   MDP-A-MS-2  
MDP-A-MS-3-GT            AND  HE-MS-3   MDP-A-MS-3  
MDP-A-MS-4-GT            AND  HE-MS-4   MDP-A-MS-4  
MDP-A-MS-5-GT            AND  HE-MS-5   MDP-A-MS-5  
MDP-A-MS-6-GT            AND  HE-MS-6   MDP-A-MS-6  
MDP-A-MS-7-GT            AND  HE-MS-7   MDP-A-MS-7  
^EOS
G-PWR,   MDP-B-MS-FT = 
MDP-B-MS-FT            OR  MDP-B-MS-1-GT  MDP-B-MS-2-GT  MDP-B-MS-3-GT  MDP-B-MS-4-GT  MDP-B-MS-5-GT  MDP-B-MS-6-GT  MDP-B-MS-7-GT  
MDP-B-MS-1-GT            AND  HE-MS-1   MDP-B-MS-1  
MDP-B-MS-2-GT            AND  HE-MS-2   MDP-B-MS-2  
MDP-B-MS-3-GT            AND  HE-MS-3   MDP-B-MS-3  
MDP-B-MS-4-GT            AND  HE-MS-4   MDP-B-MS-4  
MDP-B-MS-5-GT            AND  HE-MS-5   MDP-B-MS-5  
MDP-B-MS-6-GT            AND  HE-MS-6   MDP-B-MS-6  
MDP-B-MS-7-GT            AND  HE-MS-7   MDP-B-MS-7  
^EOS
G-PWR,   MDP-C-MS-FT = 
MDP-C-MS-FT            OR  MDP-C-MS-1-GT  MDP-C-MS-2-GT  MDP-C-MS-3-GT  MDP-C-MS-4-GT  MDP-C-MS-5-GT  MDP-C-MS-6-GT  MDP-C-MS-7-GT  
MDP-C-MS-1-GT            AND  HE-MS-1   MDP-C-MS-1  
MDP-C-MS-2-GT            AND  HE-MS-2   MDP-C-MS-2  
MDP-C-MS-3-GT            AND  HE-MS-3   MDP-C-MS-3  
MDP-C-MS-4-GT            AND  HE-MS-4   MDP-C-MS-4  
MDP-C-MS-5-GT            AND  HE-MS-5   MDP-C-MS-5  
MDP-C-MS-6-GT            AND  HE-MS-6   MDP-C-MS-6  
MDP-C-MS-7-GT            AND  HE-MS-7   MDP-C-MS-7  
^EOS
G-PWR,   MDP-D-MS-FT = 
MDP-D-MS-FT            OR  MDP-D-MS-1-GT  MDP-D-MS-2-GT  MDP-D-MS-3-GT  MDP-D-MS-4-GT  MDP-D-MS-5-GT  MDP-D-MS-6-GT  MDP-D-MS-7-GT  
MDP-D-MS-1-GT            AND  HE-MS-1   MDP-D-MS-1  
MDP-D-MS-2-GT            AND  HE-MS-2   MDP-D-MS-2  
MDP-D-MS-3-GT            AND  HE-MS-3   MDP-D-MS-3  
MDP-D-MS-4-GT            AND  HE-MS-4   MDP-D-MS-4  
MDP-D-MS-5-GT            AND  HE-MS-5   MDP-D-MS-5  
MDP-D-MS-6-GT            AND  HE-MS-6   MDP-D-MS-6  
MDP-D-MS-7-GT            AND  HE-MS-7   MDP-D-MS-7  
^EOS
G-PWR,  MDP-A-SEIS-FT =
MDP-A-MS-1-AF-FT                 TRAN
MDP-A-MS-2-AF-FT                 TRAN
MDP-A-MS-3-AF-FT                 TRAN
MDP-A-MS-4-AF-FT                 TRAN
MDP-A-MS-5-AF-FT                 TRAN
MDP-A-MS-6-AF-FT                 TRAN
MDP-A-MS-7-AF-FT                 TRAN
MDP-A-SEIS-FT                      OR  MDP-A-MS-FT  MDP-A-AS-GT
MDP-A-AS-GT                            AND MDP-A-AS-F-GT  NOT-MDP-A-MS-FT 
MDP-A-AS-F-GT                          OR  MDP-A-MS-1-AF-FT  MDP-A-MS-2-AF-FT  MDP-A-MS-3-AF-FT  MDP-A-MS-4-AF-FT  MDP-A-MS-5-AF-FT  MDP-A-MS-6-AF-FT  MDP-A-MS-7-AF-FT  
MDP-A-MS-FT                              TRAN
NOT-MDP-A-MS-FT            NOR MDP-A-MS-FT 
^EOS
G-PWR,  MDP-A-MS-1-AF-FT  = 
MDP-A-MS-1-T-4-FT                    TRAN
MDP-A-MS-1-T-8-FT                    TRAN
MDP-A-MS-1-T-12-FT                    TRAN
MDP-A-MS-1-T-16-FT                    TRAN
MDP-A-MS-1-T-20-FT                    TRAN
MDP-A-MS-1-T-24-FT                    TRAN
MDP-A-MS-1-AF-FT                  AND     HE-MS-1  MDP-A-MS-1-AF-GT1
MDP-A-MS-1-AF-GT1                    OR     MDP-A-MS-1-T-4-GT  MDP-A-MS-1-T-8-GT  MDP-A-MS-1-T-12-GT  MDP-A-MS-1-T-16-GT  MDP-A-MS-1-T-20-GT  MDP-A-MS-1-T-24-GT  
MDP-A-MS-1-T-4-GT                 AND   HE-T-4  MDP-A-MS-1-T-4-FT 
MDP-A-MS-1-T-8-GT                 AND   HE-T-8  MDP-A-MS-1-T-8-FT NOT-MDP-A-MS-1-T-4-AF-GT  
MDP-A-MS-1-T-12-GT                 AND   HE-T-12  MDP-A-MS-1-T-12-FT NOT-MDP-A-MS-1-T-4-AF-GT  NOT-MDP-A-MS-1-T-8-AF-GT  
MDP-A-MS-1-T-16-GT                 AND   HE-T-16  MDP-A-MS-1-T-16-FT NOT-MDP-A-MS-1-T-4-AF-GT  NOT-MDP-A-MS-1-T-8-AF-GT  NOT-MDP-A-MS-1-T-12-AF-GT  
MDP-A-MS-1-T-20-GT                 AND   HE-T-20  MDP-A-MS-1-T-20-FT NOT-MDP-A-MS-1-T-4-AF-GT  NOT-MDP-A-MS-1-T-8-AF-GT  NOT-MDP-A-MS-1-T-12-AF-GT  NOT-MDP-A-MS-1-T-16-AF-GT  
MDP-A-MS-1-T-24-GT                 AND   HE-T-24  MDP-A-MS-1-T-24-FT NOT-MDP-A-MS-1-T-4-AF-GT  NOT-MDP-A-MS-1-T-8-AF-GT  NOT-MDP-A-MS-1-T-12-AF-GT  NOT-MDP-A-MS-1-T-16-AF-GT  NOT-MDP-A-MS-1-T-20-AF-GT  
NOT-MDP-A-MS-1-T-4-AF-GT             NOR   MDP-A-MS-1-T-4-FT
NOT-MDP-A-MS-1-T-8-AF-GT             NOR   MDP-A-MS-1-T-8-FT
NOT-MDP-A-MS-1-T-12-AF-GT             NOR   MDP-A-MS-1-T-12-FT
NOT-MDP-A-MS-1-T-16-AF-GT             NOR   MDP-A-MS-1-T-16-FT
NOT-MDP-A-MS-1-T-20-AF-GT             NOR   MDP-A-MS-1-T-20-FT
NOT-MDP-A-MS-1-T-24-AF-GT             NOR   MDP-A-MS-1-T-24-FT
^EOS
G-PWR,   MDP-A-MS-1-T-4-FT = 
MDP-A-MS-1-T-4-FT =                   OR    MDP-A-AS-1-MS-1-T-4-CE  MDP-A-AS-2-MS-1-T-4-CE  MDP-A-AS-3-MS-1-T-4-CE  
^EOS
G-PWR,   MDP-A-MS-1-T-8-FT = 
MDP-A-MS-1-T-8-FT =                   OR    MDP-A-AS-1-MS-1-T-8-CE  MDP-A-AS-2-MS-1-T-8-CE  MDP-A-AS-3-MS-1-T-8-CE  
^EOS
G-PWR,   MDP-A-MS-1-T-12-FT = 
MDP-A-MS-1-T-12-FT =                   OR    MDP-A-AS-1-MS-1-T-12-CE  MDP-A-AS-2-MS-1-T-12-CE  MDP-A-AS-3-MS-1-T-12-CE  
^EOS
G-PWR,   MDP-A-MS-1-T-16-FT = 
MDP-A-MS-1-T-16-FT =                   OR    MDP-A-AS-1-MS-1-T-16-CE  MDP-A-AS-2-MS-1-T-16-CE  MDP-A-AS-3-MS-1-T-16-CE  
^EOS
G-PWR,   MDP-A-MS-1-T-20-FT = 
MDP-A-MS-1-T-20-FT =                   OR    MDP-A-AS-1-MS-1-T-20-CE  MDP-A-AS-2-MS-1-T-20-CE  MDP-A-AS-3-MS-1-T-20-CE  
^EOS
G-PWR,   MDP-A-MS-1-T-24-FT = 
MDP-A-MS-1-T-24-FT =                   OR    MDP-A-AS-1-MS-1-T-24-CE  MDP-A-AS-2-MS-1-T-24-CE  MDP-A-AS-3-MS-1-T-24-CE  
^EOS
G-PWR,  MDP-A-MS-2-AF-FT  = 
MDP-A-MS-2-T-4-FT                    TRAN
MDP-A-MS-2-T-8-FT                    TRAN
MDP-A-MS-2-T-12-FT                    TRAN
MDP-A-MS-2-T-16-FT                    TRAN
MDP-A-MS-2-T-20-FT                    TRAN
MDP-A-MS-2-T-24-FT                    TRAN
MDP-A-MS-2-AF-FT                  AND     HE-MS-2  MDP-A-MS-2-AF-GT1
MDP-A-MS-2-AF-GT1                    OR     MDP-A-MS-2-T-4-GT  MDP-A-MS-2-T-8-GT  MDP-A-MS-2-T-12-GT  MDP-A-MS-2-T-16-GT  MDP-A-MS-2-T-20-GT  MDP-A-MS-2-T-24-GT  
MDP-A-MS-2-T-4-GT                 AND   HE-T-4  MDP-A-MS-2-T-4-FT 
MDP-A-MS-2-T-8-GT                 AND   HE-T-8  MDP-A-MS-2-T-8-FT NOT-MDP-A-MS-2-T-4-AF-GT  
MDP-A-MS-2-T-12-GT                 AND   HE-T-12  MDP-A-MS-2-T-12-FT NOT-MDP-A-MS-2-T-4-AF-GT  NOT-MDP-A-MS-2-T-8-AF-GT  
MDP-A-MS-2-T-16-GT                 AND   HE-T-16  MDP-A-MS-2-T-16-FT NOT-MDP-A-MS-2-T-4-AF-GT  NOT-MDP-A-MS-2-T-8-AF-GT  NOT-MDP-A-MS-2-T-12-AF-GT  
MDP-A-MS-2-T-20-GT                 AND   HE-T-20  MDP-A-MS-2-T-20-FT NOT-MDP-A-MS-2-T-4-AF-GT  NOT-MDP-A-MS-2-T-8-AF-GT  NOT-MDP-A-MS-2-T-12-AF-GT  NOT-MDP-A-MS-2-T-16-AF-GT  
MDP-A-MS-2-T-24-GT                 AND   HE-T-24  MDP-A-MS-2-T-24-FT NOT-MDP-A-MS-2-T-4-AF-GT  NOT-MDP-A-MS-2-T-8-AF-GT  NOT-MDP-A-MS-2-T-12-AF-GT  NOT-MDP-A-MS-2-T-16-AF-GT  NOT-MDP-A-MS-2-T-20-AF-GT  
NOT-MDP-A-MS-2-T-4-AF-GT             NOR   MDP-A-MS-2-T-4-FT
NOT-MDP-A-MS-2-T-8-AF-GT             NOR   MDP-A-MS-2-T-8-FT
NOT-MDP-A-MS-2-T-12-AF-GT             NOR   MDP-A-MS-2-T-12-FT
NOT-MDP-A-MS-2-T-16-AF-GT             NOR   MDP-A-MS-2-T-16-FT
NOT-MDP-A-MS-2-T-20-AF-GT             NOR   MDP-A-MS-2-T-20-FT
NOT-MDP-A-MS-2-T-24-AF-GT             NOR   MDP-A-MS-2-T-24-FT
^EOS
G-PWR,   MDP-A-MS-2-T-4-FT = 
MDP-A-MS-2-T-4-FT =                   OR    MDP-A-AS-1-MS-2-T-4-CE  MDP-A-AS-2-MS-2-T-4-CE  MDP-A-AS-3-MS-2-T-4-CE  
^EOS
G-PWR,   MDP-A-MS-2-T-8-FT = 
MDP-A-MS-2-T-8-FT =                   OR    MDP-A-AS-1-MS-2-T-8-CE  MDP-A-AS-2-MS-2-T-8-CE  MDP-A-AS-3-MS-2-T-8-CE  
^EOS
G-PWR,   MDP-A-MS-2-T-12-FT = 
MDP-A-MS-2-T-12-FT =                   OR    MDP-A-AS-1-MS-2-T-12-CE  MDP-A-AS-2-MS-2-T-12-CE  MDP-A-AS-3-MS-2-T-12-CE  
^EOS
G-PWR,   MDP-A-MS-2-T-16-FT = 
MDP-A-MS-2-T-16-FT =                   OR    MDP-A-AS-1-MS-2-T-16-CE  MDP-A-AS-2-MS-2-T-16-CE  MDP-A-AS-3-MS-2-T-16-CE  
^EOS
G-PWR,   MDP-A-MS-2-T-20-FT = 
MDP-A-MS-2-T-20-FT =                   OR    MDP-A-AS-1-MS-2-T-20-CE  MDP-A-AS-2-MS-2-T-20-CE  MDP-A-AS-3-MS-2-T-20-CE  
^EOS
G-PWR,   MDP-A-MS-2-T-24-FT = 
MDP-A-MS-2-T-24-FT =                   OR    MDP-A-AS-1-MS-2-T-24-CE  MDP-A-AS-2-MS-2-T-24-CE  MDP-A-AS-3-MS-2-T-24-CE  
^EOS
G-PWR,  MDP-A-MS-3-AF-FT  = 
MDP-A-MS-3-T-4-FT                    TRAN
MDP-A-MS-3-T-8-FT                    TRAN
MDP-A-MS-3-T-12-FT                    TRAN
MDP-A-MS-3-T-16-FT                    TRAN
MDP-A-MS-3-T-20-FT                    TRAN
MDP-A-MS-3-T-24-FT                    TRAN
MDP-A-MS-3-AF-FT                  AND     HE-MS-3  MDP-A-MS-3-AF-GT1
MDP-A-MS-3-AF-GT1                    OR     MDP-A-MS-3-T-4-GT  MDP-A-MS-3-T-8-GT  MDP-A-MS-3-T-12-GT  MDP-A-MS-3-T-16-GT  MDP-A-MS-3-T-20-GT  MDP-A-MS-3-T-24-GT  
MDP-A-MS-3-T-4-GT                 AND   HE-T-4  MDP-A-MS-3-T-4-FT 
MDP-A-MS-3-T-8-GT                 AND   HE-T-8  MDP-A-MS-3-T-8-FT NOT-MDP-A-MS-3-T-4-AF-GT  
MDP-A-MS-3-T-12-GT                 AND   HE-T-12  MDP-A-MS-3-T-12-FT NOT-MDP-A-MS-3-T-4-AF-GT  NOT-MDP-A-MS-3-T-8-AF-GT  
MDP-A-MS-3-T-16-GT                 AND   HE-T-16  MDP-A-MS-3-T-16-FT NOT-MDP-A-MS-3-T-4-AF-GT  NOT-MDP-A-MS-3-T-8-AF-GT  NOT-MDP-A-MS-3-T-12-AF-GT  
MDP-A-MS-3-T-20-GT                 AND   HE-T-20  MDP-A-MS-3-T-20-FT NOT-MDP-A-MS-3-T-4-AF-GT  NOT-MDP-A-MS-3-T-8-AF-GT  NOT-MDP-A-MS-3-T-12-AF-GT  NOT-MDP-A-MS-3-T-16-AF-GT  
MDP-A-MS-3-T-24-GT                 AND   HE-T-24  MDP-A-MS-3-T-24-FT NOT-MDP-A-MS-3-T-4-AF-GT  NOT-MDP-A-MS-3-T-8-AF-GT  NOT-MDP-A-MS-3-T-12-AF-GT  NOT-MDP-A-MS-3-T-16-AF-GT  NOT-MDP-A-MS-3-T-20-AF-GT  
NOT-MDP-A-MS-3-T-4-AF-GT             NOR   MDP-A-MS-3-T-4-FT
NOT-MDP-A-MS-3-T-8-AF-GT             NOR   MDP-A-MS-3-T-8-FT
NOT-MDP-A-MS-3-T-12-AF-GT             NOR   MDP-A-MS-3-T-12-FT
NOT-MDP-A-MS-3-T-16-AF-GT             NOR   MDP-A-MS-3-T-16-FT
NOT-MDP-A-MS-3-T-20-AF-GT             NOR   MDP-A-MS-3-T-20-FT
NOT-MDP-A-MS-3-T-24-AF-GT             NOR   MDP-A-MS-3-T-24-FT
^EOS
G-PWR,   MDP-A-MS-3-T-4-FT = 
MDP-A-MS-3-T-4-FT =                   OR    MDP-A-AS-1-MS-3-T-4-CE  MDP-A-AS-2-MS-3-T-4-CE  MDP-A-AS-3-MS-3-T-4-CE  
^EOS
G-PWR,   MDP-A-MS-3-T-8-FT = 
MDP-A-MS-3-T-8-FT =                   OR    MDP-A-AS-1-MS-3-T-8-CE  MDP-A-AS-2-MS-3-T-8-CE  MDP-A-AS-3-MS-3-T-8-CE  
^EOS
G-PWR,   MDP-A-MS-3-T-12-FT = 
MDP-A-MS-3-T-12-FT =                   OR    MDP-A-AS-1-MS-3-T-12-CE  MDP-A-AS-2-MS-3-T-12-CE  MDP-A-AS-3-MS-3-T-12-CE  
^EOS
G-PWR,   MDP-A-MS-3-T-16-FT = 
MDP-A-MS-3-T-16-FT =                   OR    MDP-A-AS-1-MS-3-T-16-CE  MDP-A-AS-2-MS-3-T-16-CE  MDP-A-AS-3-MS-3-T-16-CE  
^EOS
G-PWR,   MDP-A-MS-3-T-20-FT = 
MDP-A-MS-3-T-20-FT =                   OR    MDP-A-AS-1-MS-3-T-20-CE  MDP-A-AS-2-MS-3-T-20-CE  MDP-A-AS-3-MS-3-T-20-CE  
^EOS
G-PWR,   MDP-A-MS-3-T-24-FT = 
MDP-A-MS-3-T-24-FT =                   OR    MDP-A-AS-1-MS-3-T-24-CE  MDP-A-AS-2-MS-3-T-24-CE  MDP-A-AS-3-MS-3-T-24-CE  
^EOS
G-PWR,  MDP-A-MS-4-AF-FT  = 
MDP-A-MS-4-T-4-FT                    TRAN
MDP-A-MS-4-T-8-FT                    TRAN
MDP-A-MS-4-T-12-FT                    TRAN
MDP-A-MS-4-T-16-FT                    TRAN
MDP-A-MS-4-T-20-FT                    TRAN
MDP-A-MS-4-T-24-FT                    TRAN
MDP-A-MS-4-AF-FT                  AND     HE-MS-4  MDP-A-MS-4-AF-GT1
MDP-A-MS-4-AF-GT1                    OR     MDP-A-MS-4-T-4-GT  MDP-A-MS-4-T-8-GT  MDP-A-MS-4-T-12-GT  MDP-A-MS-4-T-16-GT  MDP-A-MS-4-T-20-GT  MDP-A-MS-4-T-24-GT  
MDP-A-MS-4-T-4-GT                 AND   HE-T-4  MDP-A-MS-4-T-4-FT 
MDP-A-MS-4-T-8-GT                 AND   HE-T-8  MDP-A-MS-4-T-8-FT NOT-MDP-A-MS-4-T-4-AF-GT  
MDP-A-MS-4-T-12-GT                 AND   HE-T-12  MDP-A-MS-4-T-12-FT NOT-MDP-A-MS-4-T-4-AF-GT  NOT-MDP-A-MS-4-T-8-AF-GT  
MDP-A-MS-4-T-16-GT                 AND   HE-T-16  MDP-A-MS-4-T-16-FT NOT-MDP-A-MS-4-T-4-AF-GT  NOT-MDP-A-MS-4-T-8-AF-GT  NOT-MDP-A-MS-4-T-12-AF-GT  
MDP-A-MS-4-T-20-GT                 AND   HE-T-20  MDP-A-MS-4-T-20-FT NOT-MDP-A-MS-4-T-4-AF-GT  NOT-MDP-A-MS-4-T-8-AF-GT  NOT-MDP-A-MS-4-T-12-AF-GT  NOT-MDP-A-MS-4-T-16-AF-GT  
MDP-A-MS-4-T-24-GT                 AND   HE-T-24  MDP-A-MS-4-T-24-FT NOT-MDP-A-MS-4-T-4-AF-GT  NOT-MDP-A-MS-4-T-8-AF-GT  NOT-MDP-A-MS-4-T-12-AF-GT  NOT-MDP-A-MS-4-T-16-AF-GT  NOT-MDP-A-MS-4-T-20-AF-GT  
NOT-MDP-A-MS-4-T-4-AF-GT             NOR   MDP-A-MS-4-T-4-FT
NOT-MDP-A-MS-4-T-8-AF-GT             NOR   MDP-A-MS-4-T-8-FT
NOT-MDP-A-MS-4-T-12-AF-GT             NOR   MDP-A-MS-4-T-12-FT
NOT-MDP-A-MS-4-T-16-AF-GT             NOR   MDP-A-MS-4-T-16-FT
NOT-MDP-A-MS-4-T-20-AF-GT             NOR   MDP-A-MS-4-T-20-FT
NOT-MDP-A-MS-4-T-24-AF-GT             NOR   MDP-A-MS-4-T-24-FT
^EOS
G-PWR,   MDP-A-MS-4-T-4-FT = 
MDP-A-MS-4-T-4-FT =                   OR    MDP-A-AS-1-MS-4-T-4-CE  MDP-A-AS-2-MS-4-T-4-CE  MDP-A-AS-3-MS-4-T-4-CE  
^EOS
G-PWR,   MDP-A-MS-4-T-8-FT = 
MDP-A-MS-4-T-8-FT =                   OR    MDP-A-AS-1-MS-4-T-8-CE  MDP-A-AS-2-MS-4-T-8-CE  MDP-A-AS-3-MS-4-T-8-CE  
^EOS
G-PWR,   MDP-A-MS-4-T-12-FT = 
MDP-A-MS-4-T-12-FT =                   OR    MDP-A-AS-1-MS-4-T-12-CE  MDP-A-AS-2-MS-4-T-12-CE  MDP-A-AS-3-MS-4-T-12-CE  
^EOS
G-PWR,   MDP-A-MS-4-T-16-FT = 
MDP-A-MS-4-T-16-FT =                   OR    MDP-A-AS-1-MS-4-T-16-CE  MDP-A-AS-2-MS-4-T-16-CE  MDP-A-AS-3-MS-4-T-16-CE  
^EOS
G-PWR,   MDP-A-MS-4-T-20-FT = 
MDP-A-MS-4-T-20-FT =                   OR    MDP-A-AS-1-MS-4-T-20-CE  MDP-A-AS-2-MS-4-T-20-CE  MDP-A-AS-3-MS-4-T-20-CE  
^EOS
G-PWR,   MDP-A-MS-4-T-24-FT = 
MDP-A-MS-4-T-24-FT =                   OR    MDP-A-AS-1-MS-4-T-24-CE  MDP-A-AS-2-MS-4-T-24-CE  MDP-A-AS-3-MS-4-T-24-CE  
^EOS
G-PWR,  MDP-A-MS-5-AF-FT  = 
MDP-A-MS-5-T-4-FT                    TRAN
MDP-A-MS-5-T-8-FT                    TRAN
MDP-A-MS-5-T-12-FT                    TRAN
MDP-A-MS-5-T-16-FT                    TRAN
MDP-A-MS-5-T-20-FT                    TRAN
MDP-A-MS-5-T-24-FT                    TRAN
MDP-A-MS-5-AF-FT                  AND     HE-MS-5  MDP-A-MS-5-AF-GT1
MDP-A-MS-5-AF-GT1                    OR     MDP-A-MS-5-T-4-GT  MDP-A-MS-5-T-8-GT  MDP-A-MS-5-T-12-GT  MDP-A-MS-5-T-16-GT  MDP-A-MS-5-T-20-GT  MDP-A-MS-5-T-24-GT  
MDP-A-MS-5-T-4-GT                 AND   HE-T-4  MDP-A-MS-5-T-4-FT 
MDP-A-MS-5-T-8-GT                 AND   HE-T-8  MDP-A-MS-5-T-8-FT NOT-MDP-A-MS-5-T-4-AF-GT  
MDP-A-MS-5-T-12-GT                 AND   HE-T-12  MDP-A-MS-5-T-12-FT NOT-MDP-A-MS-5-T-4-AF-GT  NOT-MDP-A-MS-5-T-8-AF-GT  
MDP-A-MS-5-T-16-GT                 AND   HE-T-16  MDP-A-MS-5-T-16-FT NOT-MDP-A-MS-5-T-4-AF-GT  NOT-MDP-A-MS-5-T-8-AF-GT  NOT-MDP-A-MS-5-T-12-AF-GT  
MDP-A-MS-5-T-20-GT                 AND   HE-T-20  MDP-A-MS-5-T-20-FT NOT-MDP-A-MS-5-T-4-AF-GT  NOT-MDP-A-MS-5-T-8-AF-GT  NOT-MDP-A-MS-5-T-12-AF-GT  NOT-MDP-A-MS-5-T-16-AF-GT  
MDP-A-MS-5-T-24-GT                 AND   HE-T-24  MDP-A-MS-5-T-24-FT NOT-MDP-A-MS-5-T-4-AF-GT  NOT-MDP-A-MS-5-T-8-AF-GT  NOT-MDP-A-MS-5-T-12-AF-GT  NOT-MDP-A-MS-5-T-16-AF-GT  NOT-MDP-A-MS-5-T-20-AF-GT  
NOT-MDP-A-MS-5-T-4-AF-GT             NOR   MDP-A-MS-5-T-4-FT
NOT-MDP-A-MS-5-T-8-AF-GT             NOR   MDP-A-MS-5-T-8-FT
NOT-MDP-A-MS-5-T-12-AF-GT             NOR   MDP-A-MS-5-T-12-FT
NOT-MDP-A-MS-5-T-16-AF-GT             NOR   MDP-A-MS-5-T-16-FT
NOT-MDP-A-MS-5-T-20-AF-GT             NOR   MDP-A-MS-5-T-20-FT
NOT-MDP-A-MS-5-T-24-AF-GT             NOR   MDP-A-MS-5-T-24-FT
^EOS
G-PWR,   MDP-A-MS-5-T-4-FT = 
MDP-A-MS-5-T-4-FT =                   OR    MDP-A-AS-1-MS-5-T-4-CE  MDP-A-AS-2-MS-5-T-4-CE  MDP-A-AS-3-MS-5-T-4-CE  
^EOS
G-PWR,   MDP-A-MS-5-T-8-FT = 
MDP-A-MS-5-T-8-FT =                   OR    MDP-A-AS-1-MS-5-T-8-CE  MDP-A-AS-2-MS-5-T-8-CE  MDP-A-AS-3-MS-5-T-8-CE  
^EOS
G-PWR,   MDP-A-MS-5-T-12-FT = 
MDP-A-MS-5-T-12-FT =                   OR    MDP-A-AS-1-MS-5-T-12-CE  MDP-A-AS-2-MS-5-T-12-CE  MDP-A-AS-3-MS-5-T-12-CE  
^EOS
G-PWR,   MDP-A-MS-5-T-16-FT = 
MDP-A-MS-5-T-16-FT =                   OR    MDP-A-AS-1-MS-5-T-16-CE  MDP-A-AS-2-MS-5-T-16-CE  MDP-A-AS-3-MS-5-T-16-CE  
^EOS
G-PWR,   MDP-A-MS-5-T-20-FT = 
MDP-A-MS-5-T-20-FT =                   OR    MDP-A-AS-1-MS-5-T-20-CE  MDP-A-AS-2-MS-5-T-20-CE  MDP-A-AS-3-MS-5-T-20-CE  
^EOS
G-PWR,   MDP-A-MS-5-T-24-FT = 
MDP-A-MS-5-T-24-FT =                   OR    MDP-A-AS-1-MS-5-T-24-CE  MDP-A-AS-2-MS-5-T-24-CE  MDP-A-AS-3-MS-5-T-24-CE  
^EOS
G-PWR,  MDP-A-MS-6-AF-FT  = 
MDP-A-MS-6-T-4-FT                    TRAN
MDP-A-MS-6-T-8-FT                    TRAN
MDP-A-MS-6-T-12-FT                    TRAN
MDP-A-MS-6-T-16-FT                    TRAN
MDP-A-MS-6-T-20-FT                    TRAN
MDP-A-MS-6-T-24-FT                    TRAN
MDP-A-MS-6-AF-FT                  AND     HE-MS-6  MDP-A-MS-6-AF-GT1
MDP-A-MS-6-AF-GT1                    OR     MDP-A-MS-6-T-4-GT  MDP-A-MS-6-T-8-GT  MDP-A-MS-6-T-12-GT  MDP-A-MS-6-T-16-GT  MDP-A-MS-6-T-20-GT  MDP-A-MS-6-T-24-GT  
MDP-A-MS-6-T-4-GT                 AND   HE-T-4  MDP-A-MS-6-T-4-FT 
MDP-A-MS-6-T-8-GT                 AND   HE-T-8  MDP-A-MS-6-T-8-FT NOT-MDP-A-MS-6-T-4-AF-GT  
MDP-A-MS-6-T-12-GT                 AND   HE-T-12  MDP-A-MS-6-T-12-FT NOT-MDP-A-MS-6-T-4-AF-GT  NOT-MDP-A-MS-6-T-8-AF-GT  
MDP-A-MS-6-T-16-GT                 AND   HE-T-16  MDP-A-MS-6-T-16-FT NOT-MDP-A-MS-6-T-4-AF-GT  NOT-MDP-A-MS-6-T-8-AF-GT  NOT-MDP-A-MS-6-T-12-AF-GT  
MDP-A-MS-6-T-20-GT                 AND   HE-T-20  MDP-A-MS-6-T-20-FT NOT-MDP-A-MS-6-T-4-AF-GT  NOT-MDP-A-MS-6-T-8-AF-GT  NOT-MDP-A-MS-6-T-12-AF-GT  NOT-MDP-A-MS-6-T-16-AF-GT  
MDP-A-MS-6-T-24-GT                 AND   HE-T-24  MDP-A-MS-6-T-24-FT NOT-MDP-A-MS-6-T-4-AF-GT  NOT-MDP-A-MS-6-T-8-AF-GT  NOT-MDP-A-MS-6-T-12-AF-GT  NOT-MDP-A-MS-6-T-16-AF-GT  NOT-MDP-A-MS-6-T-20-AF-GT  
NOT-MDP-A-MS-6-T-4-AF-GT             NOR   MDP-A-MS-6-T-4-FT
NOT-MDP-A-MS-6-T-8-AF-GT             NOR   MDP-A-MS-6-T-8-FT
NOT-MDP-A-MS-6-T-12-AF-GT             NOR   MDP-A-MS-6-T-12-FT
NOT-MDP-A-MS-6-T-16-AF-GT             NOR   MDP-A-MS-6-T-16-FT
NOT-MDP-A-MS-6-T-20-AF-GT             NOR   MDP-A-MS-6-T-20-FT
NOT-MDP-A-MS-6-T-24-AF-GT             NOR   MDP-A-MS-6-T-24-FT
^EOS
G-PWR,   MDP-A-MS-6-T-4-FT = 
MDP-A-MS-6-T-4-FT =                   OR    MDP-A-AS-1-MS-6-T-4-CE  MDP-A-AS-2-MS-6-T-4-CE  MDP-A-AS-3-MS-6-T-4-CE  
^EOS
G-PWR,   MDP-A-MS-6-T-8-FT = 
MDP-A-MS-6-T-8-FT =                   OR    MDP-A-AS-1-MS-6-T-8-CE  MDP-A-AS-2-MS-6-T-8-CE  MDP-A-AS-3-MS-6-T-8-CE  
^EOS
G-PWR,   MDP-A-MS-6-T-12-FT = 
MDP-A-MS-6-T-12-FT =                   OR    MDP-A-AS-1-MS-6-T-12-CE  MDP-A-AS-2-MS-6-T-12-CE  MDP-A-AS-3-MS-6-T-12-CE  
^EOS
G-PWR,   MDP-A-MS-6-T-16-FT = 
MDP-A-MS-6-T-16-FT =                   OR    MDP-A-AS-1-MS-6-T-16-CE  MDP-A-AS-2-MS-6-T-16-CE  MDP-A-AS-3-MS-6-T-16-CE  
^EOS
G-PWR,   MDP-A-MS-6-T-20-FT = 
MDP-A-MS-6-T-20-FT =                   OR    MDP-A-AS-1-MS-6-T-20-CE  MDP-A-AS-2-MS-6-T-20-CE  MDP-A-AS-3-MS-6-T-20-CE  
^EOS
G-PWR,   MDP-A-MS-6-T-24-FT = 
MDP-A-MS-6-T-24-FT =                   OR    MDP-A-AS-1-MS-6-T-24-CE  MDP-A-AS-2-MS-6-T-24-CE  MDP-A-AS-3-MS-6-T-24-CE  
^EOS
G-PWR,  MDP-A-MS-7-AF-FT  = 
MDP-A-MS-7-T-4-FT                    TRAN
MDP-A-MS-7-T-8-FT                    TRAN
MDP-A-MS-7-T-12-FT                    TRAN
MDP-A-MS-7-T-16-FT                    TRAN
MDP-A-MS-7-T-20-FT                    TRAN
MDP-A-MS-7-T-24-FT                    TRAN
MDP-A-MS-7-AF-FT                  AND     HE-MS-7  MDP-A-MS-7-AF-GT1
MDP-A-MS-7-AF-GT1                    OR     MDP-A-MS-7-T-4-GT  MDP-A-MS-7-T-8-GT  MDP-A-MS-7-T-12-GT  MDP-A-MS-7-T-16-GT  MDP-A-MS-7-T-20-GT  MDP-A-MS-7-T-24-GT  
MDP-A-MS-7-T-4-GT                 AND   HE-T-4  MDP-A-MS-7-T-4-FT 
MDP-A-MS-7-T-8-GT                 AND   HE-T-8  MDP-A-MS-7-T-8-FT NOT-MDP-A-MS-7-T-4-AF-GT  
MDP-A-MS-7-T-12-GT                 AND   HE-T-12  MDP-A-MS-7-T-12-FT NOT-MDP-A-MS-7-T-4-AF-GT  NOT-MDP-A-MS-7-T-8-AF-GT  
MDP-A-MS-7-T-16-GT                 AND   HE-T-16  MDP-A-MS-7-T-16-FT NOT-MDP-A-MS-7-T-4-AF-GT  NOT-MDP-A-MS-7-T-8-AF-GT  NOT-MDP-A-MS-7-T-12-AF-GT  
MDP-A-MS-7-T-20-GT                 AND   HE-T-20  MDP-A-MS-7-T-20-FT NOT-MDP-A-MS-7-T-4-AF-GT  NOT-MDP-A-MS-7-T-8-AF-GT  NOT-MDP-A-MS-7-T-12-AF-GT  NOT-MDP-A-MS-7-T-16-AF-GT  
MDP-A-MS-7-T-24-GT                 AND   HE-T-24  MDP-A-MS-7-T-24-FT NOT-MDP-A-MS-7-T-4-AF-GT  NOT-MDP-A-MS-7-T-8-AF-GT  NOT-MDP-A-MS-7-T-12-AF-GT  NOT-MDP-A-MS-7-T-16-AF-GT  NOT-MDP-A-MS-7-T-20-AF-GT  
NOT-MDP-A-MS-7-T-4-AF-GT             NOR   MDP-A-MS-7-T-4-FT
NOT-MDP-A-MS-7-T-8-AF-GT             NOR   MDP-A-MS-7-T-8-FT
NOT-MDP-A-MS-7-T-12-AF-GT             NOR   MDP-A-MS-7-T-12-FT
NOT-MDP-A-MS-7-T-16-AF-GT             NOR   MDP-A-MS-7-T-16-FT
NOT-MDP-A-MS-7-T-20-AF-GT             NOR   MDP-A-MS-7-T-20-FT
NOT-MDP-A-MS-7-T-24-AF-GT             NOR   MDP-A-MS-7-T-24-FT
^EOS
G-PWR,   MDP-A-MS-7-T-4-FT = 
MDP-A-MS-7-T-4-FT =                   OR    MDP-A-AS-1-MS-7-T-4-CE  MDP-A-AS-2-MS-7-T-4-CE  MDP-A-AS-3-MS-7-T-4-CE  
^EOS
G-PWR,   MDP-A-MS-7-T-8-FT = 
MDP-A-MS-7-T-8-FT =                   OR    MDP-A-AS-1-MS-7-T-8-CE  MDP-A-AS-2-MS-7-T-8-CE  MDP-A-AS-3-MS-7-T-8-CE  
^EOS
G-PWR,   MDP-A-MS-7-T-12-FT = 
MDP-A-MS-7-T-12-FT =                   OR    MDP-A-AS-1-MS-7-T-12-CE  MDP-A-AS-2-MS-7-T-12-CE  MDP-A-AS-3-MS-7-T-12-CE  
^EOS
G-PWR,   MDP-A-MS-7-T-16-FT = 
MDP-A-MS-7-T-16-FT =                   OR    MDP-A-AS-1-MS-7-T-16-CE  MDP-A-AS-2-MS-7-T-16-CE  MDP-A-AS-3-MS-7-T-16-CE  
^EOS
G-PWR,   MDP-A-MS-7-T-20-FT = 
MDP-A-MS-7-T-20-FT =                   OR    MDP-A-AS-1-MS-7-T-20-CE  MDP-A-AS-2-MS-7-T-20-CE  MDP-A-AS-3-MS-7-T-20-CE  
^EOS
G-PWR,   MDP-A-MS-7-T-24-FT = 
MDP-A-MS-7-T-24-FT =                   OR    MDP-A-AS-1-MS-7-T-24-CE  MDP-A-AS-2-MS-7-T-24-CE  MDP-A-AS-3-MS-7-T-24-CE  
^EOS
G-PWR,  MDP-B-SEIS-FT =
MDP-B-MS-1-AF-FT                 TRAN
MDP-B-MS-2-AF-FT                 TRAN
MDP-B-MS-3-AF-FT                 TRAN
MDP-B-MS-4-AF-FT                 TRAN
MDP-B-MS-5-AF-FT                 TRAN
MDP-B-MS-6-AF-FT                 TRAN
MDP-B-MS-7-AF-FT                 TRAN
MDP-B-SEIS-FT                      OR  MDP-B-MS-FT  MDP-B-AS-GT
MDP-B-AS-GT                            AND MDP-B-AS-F-GT  NOT-MDP-B-MS-FT 
MDP-B-AS-F-GT                          OR  MDP-B-MS-1-AF-FT  MDP-B-MS-2-AF-FT  MDP-B-MS-3-AF-FT  MDP-B-MS-4-AF-FT  MDP-B-MS-5-AF-FT  MDP-B-MS-6-AF-FT  MDP-B-MS-7-AF-FT  
MDP-B-MS-FT                              TRAN
NOT-MDP-B-MS-FT            NOR MDP-B-MS-FT 
^EOS
G-PWR,  MDP-B-MS-1-AF-FT  = 
MDP-B-MS-1-T-4-FT                    TRAN
MDP-B-MS-1-T-8-FT                    TRAN
MDP-B-MS-1-T-12-FT                    TRAN
MDP-B-MS-1-T-16-FT                    TRAN
MDP-B-MS-1-T-20-FT                    TRAN
MDP-B-MS-1-T-24-FT                    TRAN
MDP-B-MS-1-AF-FT                  AND     HE-MS-1  MDP-B-MS-1-AF-GT1
MDP-B-MS-1-AF-GT1                    OR     MDP-B-MS-1-T-4-GT  MDP-B-MS-1-T-8-GT  MDP-B-MS-1-T-12-GT  MDP-B-MS-1-T-16-GT  MDP-B-MS-1-T-20-GT  MDP-B-MS-1-T-24-GT  
MDP-B-MS-1-T-4-GT                 AND   HE-T-4  MDP-B-MS-1-T-4-FT 
MDP-B-MS-1-T-8-GT                 AND   HE-T-8  MDP-B-MS-1-T-8-FT NOT-MDP-B-MS-1-T-4-AF-GT  
MDP-B-MS-1-T-12-GT                 AND   HE-T-12  MDP-B-MS-1-T-12-FT NOT-MDP-B-MS-1-T-4-AF-GT  NOT-MDP-B-MS-1-T-8-AF-GT  
MDP-B-MS-1-T-16-GT                 AND   HE-T-16  MDP-B-MS-1-T-16-FT NOT-MDP-B-MS-1-T-4-AF-GT  NOT-MDP-B-MS-1-T-8-AF-GT  NOT-MDP-B-MS-1-T-12-AF-GT  
MDP-B-MS-1-T-20-GT                 AND   HE-T-20  MDP-B-MS-1-T-20-FT NOT-MDP-B-MS-1-T-4-AF-GT  NOT-MDP-B-MS-1-T-8-AF-GT  NOT-MDP-B-MS-1-T-12-AF-GT  NOT-MDP-B-MS-1-T-16-AF-GT  
MDP-B-MS-1-T-24-GT                 AND   HE-T-24  MDP-B-MS-1-T-24-FT NOT-MDP-B-MS-1-T-4-AF-GT  NOT-MDP-B-MS-1-T-8-AF-GT  NOT-MDP-B-MS-1-T-12-AF-GT  NOT-MDP-B-MS-1-T-16-AF-GT  NOT-MDP-B-MS-1-T-20-AF-GT  
NOT-MDP-B-MS-1-T-4-AF-GT             NOR   MDP-B-MS-1-T-4-FT
NOT-MDP-B-MS-1-T-8-AF-GT             NOR   MDP-B-MS-1-T-8-FT
NOT-MDP-B-MS-1-T-12-AF-GT             NOR   MDP-B-MS-1-T-12-FT
NOT-MDP-B-MS-1-T-16-AF-GT             NOR   MDP-B-MS-1-T-16-FT
NOT-MDP-B-MS-1-T-20-AF-GT             NOR   MDP-B-MS-1-T-20-FT
NOT-MDP-B-MS-1-T-24-AF-GT             NOR   MDP-B-MS-1-T-24-FT
^EOS
G-PWR,   MDP-B-MS-1-T-4-FT = 
MDP-B-MS-1-T-4-FT =                   OR    MDP-B-AS-1-MS-1-T-4-CE  MDP-B-AS-2-MS-1-T-4-CE  MDP-B-AS-3-MS-1-T-4-CE  
^EOS
G-PWR,   MDP-B-MS-1-T-8-FT = 
MDP-B-MS-1-T-8-FT =                   OR    MDP-B-AS-1-MS-1-T-8-CE  MDP-B-AS-2-MS-1-T-8-CE  MDP-B-AS-3-MS-1-T-8-CE  
^EOS
G-PWR,   MDP-B-MS-1-T-12-FT = 
MDP-B-MS-1-T-12-FT =                   OR    MDP-B-AS-1-MS-1-T-12-CE  MDP-B-AS-2-MS-1-T-12-CE  MDP-B-AS-3-MS-1-T-12-CE  
^EOS
G-PWR,   MDP-B-MS-1-T-16-FT = 
MDP-B-MS-1-T-16-FT =                   OR    MDP-B-AS-1-MS-1-T-16-CE  MDP-B-AS-2-MS-1-T-16-CE  MDP-B-AS-3-MS-1-T-16-CE  
^EOS
G-PWR,   MDP-B-MS-1-T-20-FT = 
MDP-B-MS-1-T-20-FT =                   OR    MDP-B-AS-1-MS-1-T-20-CE  MDP-B-AS-2-MS-1-T-20-CE  MDP-B-AS-3-MS-1-T-20-CE  
^EOS
G-PWR,   MDP-B-MS-1-T-24-FT = 
MDP-B-MS-1-T-24-FT =                   OR    MDP-B-AS-1-MS-1-T-24-CE  MDP-B-AS-2-MS-1-T-24-CE  MDP-B-AS-3-MS-1-T-24-CE  
^EOS
G-PWR,  MDP-B-MS-2-AF-FT  = 
MDP-B-MS-2-T-4-FT                    TRAN
MDP-B-MS-2-T-8-FT                    TRAN
MDP-B-MS-2-T-12-FT                    TRAN
MDP-B-MS-2-T-16-FT                    TRAN
MDP-B-MS-2-T-20-FT                    TRAN
MDP-B-MS-2-T-24-FT                    TRAN
MDP-B-MS-2-AF-FT                  AND     HE-MS-2  MDP-B-MS-2-AF-GT1
MDP-B-MS-2-AF-GT1                    OR     MDP-B-MS-2-T-4-GT  MDP-B-MS-2-T-8-GT  MDP-B-MS-2-T-12-GT  MDP-B-MS-2-T-16-GT  MDP-B-MS-2-T-20-GT  MDP-B-MS-2-T-24-GT  
MDP-B-MS-2-T-4-GT                 AND   HE-T-4  MDP-B-MS-2-T-4-FT 
MDP-B-MS-2-T-8-GT                 AND   HE-T-8  MDP-B-MS-2-T-8-FT NOT-MDP-B-MS-2-T-4-AF-GT  
MDP-B-MS-2-T-12-GT                 AND   HE-T-12  MDP-B-MS-2-T-12-FT NOT-MDP-B-MS-2-T-4-AF-GT  NOT-MDP-B-MS-2-T-8-AF-GT  
MDP-B-MS-2-T-16-GT                 AND   HE-T-16  MDP-B-MS-2-T-16-FT NOT-MDP-B-MS-2-T-4-AF-GT  NOT-MDP-B-MS-2-T-8-AF-GT  NOT-MDP-B-MS-2-T-12-AF-GT  
MDP-B-MS-2-T-20-GT                 AND   HE-T-20  MDP-B-MS-2-T-20-FT NOT-MDP-B-MS-2-T-4-AF-GT  NOT-MDP-B-MS-2-T-8-AF-GT  NOT-MDP-B-MS-2-T-12-AF-GT  NOT-MDP-B-MS-2-T-16-AF-GT  
MDP-B-MS-2-T-24-GT                 AND   HE-T-24  MDP-B-MS-2-T-24-FT NOT-MDP-B-MS-2-T-4-AF-GT  NOT-MDP-B-MS-2-T-8-AF-GT  NOT-MDP-B-MS-2-T-12-AF-GT  NOT-MDP-B-MS-2-T-16-AF-GT  NOT-MDP-B-MS-2-T-20-AF-GT  
NOT-MDP-B-MS-2-T-4-AF-GT             NOR   MDP-B-MS-2-T-4-FT
NOT-MDP-B-MS-2-T-8-AF-GT             NOR   MDP-B-MS-2-T-8-FT
NOT-MDP-B-MS-2-T-12-AF-GT             NOR   MDP-B-MS-2-T-12-FT
NOT-MDP-B-MS-2-T-16-AF-GT             NOR   MDP-B-MS-2-T-16-FT
NOT-MDP-B-MS-2-T-20-AF-GT             NOR   MDP-B-MS-2-T-20-FT
NOT-MDP-B-MS-2-T-24-AF-GT             NOR   MDP-B-MS-2-T-24-FT
^EOS
G-PWR,   MDP-B-MS-2-T-4-FT = 
MDP-B-MS-2-T-4-FT =                   OR    MDP-B-AS-1-MS-2-T-4-CE  MDP-B-AS-2-MS-2-T-4-CE  MDP-B-AS-3-MS-2-T-4-CE  
^EOS
G-PWR,   MDP-B-MS-2-T-8-FT = 
MDP-B-MS-2-T-8-FT =                   OR    MDP-B-AS-1-MS-2-T-8-CE  MDP-B-AS-2-MS-2-T-8-CE  MDP-B-AS-3-MS-2-T-8-CE  
^EOS
G-PWR,   MDP-B-MS-2-T-12-FT = 
MDP-B-MS-2-T-12-FT =                   OR    MDP-B-AS-1-MS-2-T-12-CE  MDP-B-AS-2-MS-2-T-12-CE  MDP-B-AS-3-MS-2-T-12-CE  
^EOS
G-PWR,   MDP-B-MS-2-T-16-FT = 
MDP-B-MS-2-T-16-FT =                   OR    MDP-B-AS-1-MS-2-T-16-CE  MDP-B-AS-2-MS-2-T-16-CE  MDP-B-AS-3-MS-2-T-16-CE  
^EOS
G-PWR,   MDP-B-MS-2-T-20-FT = 
MDP-B-MS-2-T-20-FT =                   OR    MDP-B-AS-1-MS-2-T-20-CE  MDP-B-AS-2-MS-2-T-20-CE  MDP-B-AS-3-MS-2-T-20-CE  
^EOS
G-PWR,   MDP-B-MS-2-T-24-FT = 
MDP-B-MS-2-T-24-FT =                   OR    MDP-B-AS-1-MS-2-T-24-CE  MDP-B-AS-2-MS-2-T-24-CE  MDP-B-AS-3-MS-2-T-24-CE  
^EOS
G-PWR,  MDP-B-MS-3-AF-FT  = 
MDP-B-MS-3-T-4-FT                    TRAN
MDP-B-MS-3-T-8-FT                    TRAN
MDP-B-MS-3-T-12-FT                    TRAN
MDP-B-MS-3-T-16-FT                    TRAN
MDP-B-MS-3-T-20-FT                    TRAN
MDP-B-MS-3-T-24-FT                    TRAN
MDP-B-MS-3-AF-FT                  AND     HE-MS-3  MDP-B-MS-3-AF-GT1
MDP-B-MS-3-AF-GT1                    OR     MDP-B-MS-3-T-4-GT  MDP-B-MS-3-T-8-GT  MDP-B-MS-3-T-12-GT  MDP-B-MS-3-T-16-GT  MDP-B-MS-3-T-20-GT  MDP-B-MS-3-T-24-GT  
MDP-B-MS-3-T-4-GT                 AND   HE-T-4  MDP-B-MS-3-T-4-FT 
MDP-B-MS-3-T-8-GT                 AND   HE-T-8  MDP-B-MS-3-T-8-FT NOT-MDP-B-MS-3-T-4-AF-GT  
MDP-B-MS-3-T-12-GT                 AND   HE-T-12  MDP-B-MS-3-T-12-FT NOT-MDP-B-MS-3-T-4-AF-GT  NOT-MDP-B-MS-3-T-8-AF-GT  
MDP-B-MS-3-T-16-GT                 AND   HE-T-16  MDP-B-MS-3-T-16-FT NOT-MDP-B-MS-3-T-4-AF-GT  NOT-MDP-B-MS-3-T-8-AF-GT  NOT-MDP-B-MS-3-T-12-AF-GT  
MDP-B-MS-3-T-20-GT                 AND   HE-T-20  MDP-B-MS-3-T-20-FT NOT-MDP-B-MS-3-T-4-AF-GT  NOT-MDP-B-MS-3-T-8-AF-GT  NOT-MDP-B-MS-3-T-12-AF-GT  NOT-MDP-B-MS-3-T-16-AF-GT  
MDP-B-MS-3-T-24-GT                 AND   HE-T-24  MDP-B-MS-3-T-24-FT NOT-MDP-B-MS-3-T-4-AF-GT  NOT-MDP-B-MS-3-T-8-AF-GT  NOT-MDP-B-MS-3-T-12-AF-GT  NOT-MDP-B-MS-3-T-16-AF-GT  NOT-MDP-B-MS-3-T-20-AF-GT  
NOT-MDP-B-MS-3-T-4-AF-GT             NOR   MDP-B-MS-3-T-4-FT
NOT-MDP-B-MS-3-T-8-AF-GT             NOR   MDP-B-MS-3-T-8-FT
NOT-MDP-B-MS-3-T-12-AF-GT             NOR   MDP-B-MS-3-T-12-FT
NOT-MDP-B-MS-3-T-16-AF-GT             NOR   MDP-B-MS-3-T-16-FT
NOT-MDP-B-MS-3-T-20-AF-GT             NOR   MDP-B-MS-3-T-20-FT
NOT-MDP-B-MS-3-T-24-AF-GT             NOR   MDP-B-MS-3-T-24-FT
^EOS
G-PWR,   MDP-B-MS-3-T-4-FT = 
MDP-B-MS-3-T-4-FT =                   OR    MDP-B-AS-1-MS-3-T-4-CE  MDP-B-AS-2-MS-3-T-4-CE  MDP-B-AS-3-MS-3-T-4-CE  
^EOS
G-PWR,   MDP-B-MS-3-T-8-FT = 
MDP-B-MS-3-T-8-FT =                   OR    MDP-B-AS-1-MS-3-T-8-CE  MDP-B-AS-2-MS-3-T-8-CE  MDP-B-AS-3-MS-3-T-8-CE  
^EOS
G-PWR,   MDP-B-MS-3-T-12-FT = 
MDP-B-MS-3-T-12-FT =                   OR    MDP-B-AS-1-MS-3-T-12-CE  MDP-B-AS-2-MS-3-T-12-CE  MDP-B-AS-3-MS-3-T-12-CE  
^EOS
G-PWR,   MDP-B-MS-3-T-16-FT = 
MDP-B-MS-3-T-16-FT =                   OR    MDP-B-AS-1-MS-3-T-16-CE  MDP-B-AS-2-MS-3-T-16-CE  MDP-B-AS-3-MS-3-T-16-CE  
^EOS
G-PWR,   MDP-B-MS-3-T-20-FT = 
MDP-B-MS-3-T-20-FT =                   OR    MDP-B-AS-1-MS-3-T-20-CE  MDP-B-AS-2-MS-3-T-20-CE  MDP-B-AS-3-MS-3-T-20-CE  
^EOS
G-PWR,   MDP-B-MS-3-T-24-FT = 
MDP-B-MS-3-T-24-FT =                   OR    MDP-B-AS-1-MS-3-T-24-CE  MDP-B-AS-2-MS-3-T-24-CE  MDP-B-AS-3-MS-3-T-24-CE  
^EOS
G-PWR,  MDP-B-MS-4-AF-FT  = 
MDP-B-MS-4-T-4-FT                    TRAN
MDP-B-MS-4-T-8-FT                    TRAN
MDP-B-MS-4-T-12-FT                    TRAN
MDP-B-MS-4-T-16-FT                    TRAN
MDP-B-MS-4-T-20-FT                    TRAN
MDP-B-MS-4-T-24-FT                    TRAN
MDP-B-MS-4-AF-FT                  AND     HE-MS-4  MDP-B-MS-4-AF-GT1
MDP-B-MS-4-AF-GT1                    OR     MDP-B-MS-4-T-4-GT  MDP-B-MS-4-T-8-GT  MDP-B-MS-4-T-12-GT  MDP-B-MS-4-T-16-GT  MDP-B-MS-4-T-20-GT  MDP-B-MS-4-T-24-GT  
MDP-B-MS-4-T-4-GT                 AND   HE-T-4  MDP-B-MS-4-T-4-FT 
MDP-B-MS-4-T-8-GT                 AND   HE-T-8  MDP-B-MS-4-T-8-FT NOT-MDP-B-MS-4-T-4-AF-GT  
MDP-B-MS-4-T-12-GT                 AND   HE-T-12  MDP-B-MS-4-T-12-FT NOT-MDP-B-MS-4-T-4-AF-GT  NOT-MDP-B-MS-4-T-8-AF-GT  
MDP-B-MS-4-T-16-GT                 AND   HE-T-16  MDP-B-MS-4-T-16-FT NOT-MDP-B-MS-4-T-4-AF-GT  NOT-MDP-B-MS-4-T-8-AF-GT  NOT-MDP-B-MS-4-T-12-AF-GT  
MDP-B-MS-4-T-20-GT                 AND   HE-T-20  MDP-B-MS-4-T-20-FT NOT-MDP-B-MS-4-T-4-AF-GT  NOT-MDP-B-MS-4-T-8-AF-GT  NOT-MDP-B-MS-4-T-12-AF-GT  NOT-MDP-B-MS-4-T-16-AF-GT  
MDP-B-MS-4-T-24-GT                 AND   HE-T-24  MDP-B-MS-4-T-24-FT NOT-MDP-B-MS-4-T-4-AF-GT  NOT-MDP-B-MS-4-T-8-AF-GT  NOT-MDP-B-MS-4-T-12-AF-GT  NOT-MDP-B-MS-4-T-16-AF-GT  NOT-MDP-B-MS-4-T-20-AF-GT  
NOT-MDP-B-MS-4-T-4-AF-GT             NOR   MDP-B-MS-4-T-4-FT
NOT-MDP-B-MS-4-T-8-AF-GT             NOR   MDP-B-MS-4-T-8-FT
NOT-MDP-B-MS-4-T-12-AF-GT             NOR   MDP-B-MS-4-T-12-FT
NOT-MDP-B-MS-4-T-16-AF-GT             NOR   MDP-B-MS-4-T-16-FT
NOT-MDP-B-MS-4-T-20-AF-GT             NOR   MDP-B-MS-4-T-20-FT
NOT-MDP-B-MS-4-T-24-AF-GT             NOR   MDP-B-MS-4-T-24-FT
^EOS
G-PWR,   MDP-B-MS-4-T-4-FT = 
MDP-B-MS-4-T-4-FT =                   OR    MDP-B-AS-1-MS-4-T-4-CE  MDP-B-AS-2-MS-4-T-4-CE  MDP-B-AS-3-MS-4-T-4-CE  
^EOS
G-PWR,   MDP-B-MS-4-T-8-FT = 
MDP-B-MS-4-T-8-FT =                   OR    MDP-B-AS-1-MS-4-T-8-CE  MDP-B-AS-2-MS-4-T-8-CE  MDP-B-AS-3-MS-4-T-8-CE  
^EOS
G-PWR,   MDP-B-MS-4-T-12-FT = 
MDP-B-MS-4-T-12-FT =                   OR    MDP-B-AS-1-MS-4-T-12-CE  MDP-B-AS-2-MS-4-T-12-CE  MDP-B-AS-3-MS-4-T-12-CE  
^EOS
G-PWR,   MDP-B-MS-4-T-16-FT = 
MDP-B-MS-4-T-16-FT =                   OR    MDP-B-AS-1-MS-4-T-16-CE  MDP-B-AS-2-MS-4-T-16-CE  MDP-B-AS-3-MS-4-T-16-CE  
^EOS
G-PWR,   MDP-B-MS-4-T-20-FT = 
MDP-B-MS-4-T-20-FT =                   OR    MDP-B-AS-1-MS-4-T-20-CE  MDP-B-AS-2-MS-4-T-20-CE  MDP-B-AS-3-MS-4-T-20-CE  
^EOS
G-PWR,   MDP-B-MS-4-T-24-FT = 
MDP-B-MS-4-T-24-FT =                   OR    MDP-B-AS-1-MS-4-T-24-CE  MDP-B-AS-2-MS-4-T-24-CE  MDP-B-AS-3-MS-4-T-24-CE  
^EOS
G-PWR,  MDP-B-MS-5-AF-FT  = 
MDP-B-MS-5-T-4-FT                    TRAN
MDP-B-MS-5-T-8-FT                    TRAN
MDP-B-MS-5-T-12-FT                    TRAN
MDP-B-MS-5-T-16-FT                    TRAN
MDP-B-MS-5-T-20-FT                    TRAN
MDP-B-MS-5-T-24-FT                    TRAN
MDP-B-MS-5-AF-FT                  AND     HE-MS-5  MDP-B-MS-5-AF-GT1
MDP-B-MS-5-AF-GT1                    OR     MDP-B-MS-5-T-4-GT  MDP-B-MS-5-T-8-GT  MDP-B-MS-5-T-12-GT  MDP-B-MS-5-T-16-GT  MDP-B-MS-5-T-20-GT  MDP-B-MS-5-T-24-GT  
MDP-B-MS-5-T-4-GT                 AND   HE-T-4  MDP-B-MS-5-T-4-FT 
MDP-B-MS-5-T-8-GT                 AND   HE-T-8  MDP-B-MS-5-T-8-FT NOT-MDP-B-MS-5-T-4-AF-GT  
MDP-B-MS-5-T-12-GT                 AND   HE-T-12  MDP-B-MS-5-T-12-FT NOT-MDP-B-MS-5-T-4-AF-GT  NOT-MDP-B-MS-5-T-8-AF-GT  
MDP-B-MS-5-T-16-GT                 AND   HE-T-16  MDP-B-MS-5-T-16-FT NOT-MDP-B-MS-5-T-4-AF-GT  NOT-MDP-B-MS-5-T-8-AF-GT  NOT-MDP-B-MS-5-T-12-AF-GT  
MDP-B-MS-5-T-20-GT                 AND   HE-T-20  MDP-B-MS-5-T-20-FT NOT-MDP-B-MS-5-T-4-AF-GT  NOT-MDP-B-MS-5-T-8-AF-GT  NOT-MDP-B-MS-5-T-12-AF-GT  NOT-MDP-B-MS-5-T-16-AF-GT  
MDP-B-MS-5-T-24-GT                 AND   HE-T-24  MDP-B-MS-5-T-24-FT NOT-MDP-B-MS-5-T-4-AF-GT  NOT-MDP-B-MS-5-T-8-AF-GT  NOT-MDP-B-MS-5-T-12-AF-GT  NOT-MDP-B-MS-5-T-16-AF-GT  NOT-MDP-B-MS-5-T-20-AF-GT  
NOT-MDP-B-MS-5-T-4-AF-GT             NOR   MDP-B-MS-5-T-4-FT
NOT-MDP-B-MS-5-T-8-AF-GT             NOR   MDP-B-MS-5-T-8-FT
NOT-MDP-B-MS-5-T-12-AF-GT             NOR   MDP-B-MS-5-T-12-FT
NOT-MDP-B-MS-5-T-16-AF-GT             NOR   MDP-B-MS-5-T-16-FT
NOT-MDP-B-MS-5-T-20-AF-GT             NOR   MDP-B-MS-5-T-20-FT
NOT-MDP-B-MS-5-T-24-AF-GT             NOR   MDP-B-MS-5-T-24-FT
^EOS
G-PWR,   MDP-B-MS-5-T-4-FT = 
MDP-B-MS-5-T-4-FT =                   OR    MDP-B-AS-1-MS-5-T-4-CE  MDP-B-AS-2-MS-5-T-4-CE  MDP-B-AS-3-MS-5-T-4-CE  
^EOS
G-PWR,   MDP-B-MS-5-T-8-FT = 
MDP-B-MS-5-T-8-FT =                   OR    MDP-B-AS-1-MS-5-T-8-CE  MDP-B-AS-2-MS-5-T-8-CE  MDP-B-AS-3-MS-5-T-8-CE  
^EOS
G-PWR,   MDP-B-MS-5-T-12-FT = 
MDP-B-MS-5-T-12-FT =                   OR    MDP-B-AS-1-MS-5-T-12-CE  MDP-B-AS-2-MS-5-T-12-CE  MDP-B-AS-3-MS-5-T-12-CE  
^EOS
G-PWR,   MDP-B-MS-5-T-16-FT = 
MDP-B-MS-5-T-16-FT =                   OR    MDP-B-AS-1-MS-5-T-16-CE  MDP-B-AS-2-MS-5-T-16-CE  MDP-B-AS-3-MS-5-T-16-CE  
^EOS
G-PWR,   MDP-B-MS-5-T-20-FT = 
MDP-B-MS-5-T-20-FT =                   OR    MDP-B-AS-1-MS-5-T-20-CE  MDP-B-AS-2-MS-5-T-20-CE  MDP-B-AS-3-MS-5-T-20-CE  
^EOS
G-PWR,   MDP-B-MS-5-T-24-FT = 
MDP-B-MS-5-T-24-FT =                   OR    MDP-B-AS-1-MS-5-T-24-CE  MDP-B-AS-2-MS-5-T-24-CE  MDP-B-AS-3-MS-5-T-24-CE  
^EOS
G-PWR,  MDP-B-MS-6-AF-FT  = 
MDP-B-MS-6-T-4-FT                    TRAN
MDP-B-MS-6-T-8-FT                    TRAN
MDP-B-MS-6-T-12-FT                    TRAN
MDP-B-MS-6-T-16-FT                    TRAN
MDP-B-MS-6-T-20-FT                    TRAN
MDP-B-MS-6-T-24-FT                    TRAN
MDP-B-MS-6-AF-FT                  AND     HE-MS-6  MDP-B-MS-6-AF-GT1
MDP-B-MS-6-AF-GT1                    OR     MDP-B-MS-6-T-4-GT  MDP-B-MS-6-T-8-GT  MDP-B-MS-6-T-12-GT  MDP-B-MS-6-T-16-GT  MDP-B-MS-6-T-20-GT  MDP-B-MS-6-T-24-GT  
MDP-B-MS-6-T-4-GT                 AND   HE-T-4  MDP-B-MS-6-T-4-FT 
MDP-B-MS-6-T-8-GT                 AND   HE-T-8  MDP-B-MS-6-T-8-FT NOT-MDP-B-MS-6-T-4-AF-GT  
MDP-B-MS-6-T-12-GT                 AND   HE-T-12  MDP-B-MS-6-T-12-FT NOT-MDP-B-MS-6-T-4-AF-GT  NOT-MDP-B-MS-6-T-8-AF-GT  
MDP-B-MS-6-T-16-GT                 AND   HE-T-16  MDP-B-MS-6-T-16-FT NOT-MDP-B-MS-6-T-4-AF-GT  NOT-MDP-B-MS-6-T-8-AF-GT  NOT-MDP-B-MS-6-T-12-AF-GT  
MDP-B-MS-6-T-20-GT                 AND   HE-T-20  MDP-B-MS-6-T-20-FT NOT-MDP-B-MS-6-T-4-AF-GT  NOT-MDP-B-MS-6-T-8-AF-GT  NOT-MDP-B-MS-6-T-12-AF-GT  NOT-MDP-B-MS-6-T-16-AF-GT  
MDP-B-MS-6-T-24-GT                 AND   HE-T-24  MDP-B-MS-6-T-24-FT NOT-MDP-B-MS-6-T-4-AF-GT  NOT-MDP-B-MS-6-T-8-AF-GT  NOT-MDP-B-MS-6-T-12-AF-GT  NOT-MDP-B-MS-6-T-16-AF-GT  NOT-MDP-B-MS-6-T-20-AF-GT  
NOT-MDP-B-MS-6-T-4-AF-GT             NOR   MDP-B-MS-6-T-4-FT
NOT-MDP-B-MS-6-T-8-AF-GT             NOR   MDP-B-MS-6-T-8-FT
NOT-MDP-B-MS-6-T-12-AF-GT             NOR   MDP-B-MS-6-T-12-FT
NOT-MDP-B-MS-6-T-16-AF-GT             NOR   MDP-B-MS-6-T-16-FT
NOT-MDP-B-MS-6-T-20-AF-GT             NOR   MDP-B-MS-6-T-20-FT
NOT-MDP-B-MS-6-T-24-AF-GT             NOR   MDP-B-MS-6-T-24-FT
^EOS
G-PWR,   MDP-B-MS-6-T-4-FT = 
MDP-B-MS-6-T-4-FT =                   OR    MDP-B-AS-1-MS-6-T-4-CE  MDP-B-AS-2-MS-6-T-4-CE  MDP-B-AS-3-MS-6-T-4-CE  
^EOS
G-PWR,   MDP-B-MS-6-T-8-FT = 
MDP-B-MS-6-T-8-FT =                   OR    MDP-B-AS-1-MS-6-T-8-CE  MDP-B-AS-2-MS-6-T-8-CE  MDP-B-AS-3-MS-6-T-8-CE  
^EOS
G-PWR,   MDP-B-MS-6-T-12-FT = 
MDP-B-MS-6-T-12-FT =                   OR    MDP-B-AS-1-MS-6-T-12-CE  MDP-B-AS-2-MS-6-T-12-CE  MDP-B-AS-3-MS-6-T-12-CE  
^EOS
G-PWR,   MDP-B-MS-6-T-16-FT = 
MDP-B-MS-6-T-16-FT =                   OR    MDP-B-AS-1-MS-6-T-16-CE  MDP-B-AS-2-MS-6-T-16-CE  MDP-B-AS-3-MS-6-T-16-CE  
^EOS
G-PWR,   MDP-B-MS-6-T-20-FT = 
MDP-B-MS-6-T-20-FT =                   OR    MDP-B-AS-1-MS-6-T-20-CE  MDP-B-AS-2-MS-6-T-20-CE  MDP-B-AS-3-MS-6-T-20-CE  
^EOS
G-PWR,   MDP-B-MS-6-T-24-FT = 
MDP-B-MS-6-T-24-FT =                   OR    MDP-B-AS-1-MS-6-T-24-CE  MDP-B-AS-2-MS-6-T-24-CE  MDP-B-AS-3-MS-6-T-24-CE  
^EOS
G-PWR,  MDP-B-MS-7-AF-FT  = 
MDP-B-MS-7-T-4-FT                    TRAN
MDP-B-MS-7-T-8-FT                    TRAN
MDP-B-MS-7-T-12-FT                    TRAN
MDP-B-MS-7-T-16-FT                    TRAN
MDP-B-MS-7-T-20-FT                    TRAN
MDP-B-MS-7-T-24-FT                    TRAN
MDP-B-MS-7-AF-FT                  AND     HE-MS-7  MDP-B-MS-7-AF-GT1
MDP-B-MS-7-AF-GT1                    OR     MDP-B-MS-7-T-4-GT  MDP-B-MS-7-T-8-GT  MDP-B-MS-7-T-12-GT  MDP-B-MS-7-T-16-GT  MDP-B-MS-7-T-20-GT  MDP-B-MS-7-T-24-GT  
MDP-B-MS-7-T-4-GT                 AND   HE-T-4  MDP-B-MS-7-T-4-FT 
MDP-B-MS-7-T-8-GT                 AND   HE-T-8  MDP-B-MS-7-T-8-FT NOT-MDP-B-MS-7-T-4-AF-GT  
MDP-B-MS-7-T-12-GT                 AND   HE-T-12  MDP-B-MS-7-T-12-FT NOT-MDP-B-MS-7-T-4-AF-GT  NOT-MDP-B-MS-7-T-8-AF-GT  
MDP-B-MS-7-T-16-GT                 AND   HE-T-16  MDP-B-MS-7-T-16-FT NOT-MDP-B-MS-7-T-4-AF-GT  NOT-MDP-B-MS-7-T-8-AF-GT  NOT-MDP-B-MS-7-T-12-AF-GT  
MDP-B-MS-7-T-20-GT                 AND   HE-T-20  MDP-B-MS-7-T-20-FT NOT-MDP-B-MS-7-T-4-AF-GT  NOT-MDP-B-MS-7-T-8-AF-GT  NOT-MDP-B-MS-7-T-12-AF-GT  NOT-MDP-B-MS-7-T-16-AF-GT  
MDP-B-MS-7-T-24-GT                 AND   HE-T-24  MDP-B-MS-7-T-24-FT NOT-MDP-B-MS-7-T-4-AF-GT  NOT-MDP-B-MS-7-T-8-AF-GT  NOT-MDP-B-MS-7-T-12-AF-GT  NOT-MDP-B-MS-7-T-16-AF-GT  NOT-MDP-B-MS-7-T-20-AF-GT  
NOT-MDP-B-MS-7-T-4-AF-GT             NOR   MDP-B-MS-7-T-4-FT
NOT-MDP-B-MS-7-T-8-AF-GT             NOR   MDP-B-MS-7-T-8-FT
NOT-MDP-B-MS-7-T-12-AF-GT             NOR   MDP-B-MS-7-T-12-FT
NOT-MDP-B-MS-7-T-16-AF-GT             NOR   MDP-B-MS-7-T-16-FT
NOT-MDP-B-MS-7-T-20-AF-GT             NOR   MDP-B-MS-7-T-20-FT
NOT-MDP-B-MS-7-T-24-AF-GT             NOR   MDP-B-MS-7-T-24-FT
^EOS
G-PWR,   MDP-B-MS-7-T-4-FT = 
MDP-B-MS-7-T-4-FT =                   OR    MDP-B-AS-1-MS-7-T-4-CE  MDP-B-AS-2-MS-7-T-4-CE  MDP-B-AS-3-MS-7-T-4-CE  
^EOS
G-PWR,   MDP-B-MS-7-T-8-FT = 
MDP-B-MS-7-T-8-FT =                   OR    MDP-B-AS-1-MS-7-T-8-CE  MDP-B-AS-2-MS-7-T-8-CE  MDP-B-AS-3-MS-7-T-8-CE  
^EOS
G-PWR,   MDP-B-MS-7-T-12-FT = 
MDP-B-MS-7-T-12-FT =                   OR    MDP-B-AS-1-MS-7-T-12-CE  MDP-B-AS-2-MS-7-T-12-CE  MDP-B-AS-3-MS-7-T-12-CE  
^EOS
G-PWR,   MDP-B-MS-7-T-16-FT = 
MDP-B-MS-7-T-16-FT =                   OR    MDP-B-AS-1-MS-7-T-16-CE  MDP-B-AS-2-MS-7-T-16-CE  MDP-B-AS-3-MS-7-T-16-CE  
^EOS
G-PWR,   MDP-B-MS-7-T-20-FT = 
MDP-B-MS-7-T-20-FT =                   OR    MDP-B-AS-1-MS-7-T-20-CE  MDP-B-AS-2-MS-7-T-20-CE  MDP-B-AS-3-MS-7-T-20-CE  
^EOS
G-PWR,   MDP-B-MS-7-T-24-FT = 
MDP-B-MS-7-T-24-FT =                   OR    MDP-B-AS-1-MS-7-T-24-CE  MDP-B-AS-2-MS-7-T-24-CE  MDP-B-AS-3-MS-7-T-24-CE  
^EOS
G-PWR,  MDP-C-SEIS-FT =
MDP-C-MS-1-AF-FT                 TRAN
MDP-C-MS-2-AF-FT                 TRAN
MDP-C-MS-3-AF-FT                 TRAN
MDP-C-MS-4-AF-FT                 TRAN
MDP-C-MS-5-AF-FT                 TRAN
MDP-C-MS-6-AF-FT                 TRAN
MDP-C-MS-7-AF-FT                 TRAN
MDP-C-SEIS-FT                      OR  MDP-C-MS-FT  MDP-C-AS-GT
MDP-C-AS-GT                            AND MDP-C-AS-F-GT  NOT-MDP-C-MS-FT 
MDP-C-AS-F-GT                          OR  MDP-C-MS-1-AF-FT  MDP-C-MS-2-AF-FT  MDP-C-MS-3-AF-FT  MDP-C-MS-4-AF-FT  MDP-C-MS-5-AF-FT  MDP-C-MS-6-AF-FT  MDP-C-MS-7-AF-FT  
MDP-C-MS-FT                              TRAN
NOT-MDP-C-MS-FT            NOR MDP-C-MS-FT 
^EOS
G-PWR,  MDP-C-MS-1-AF-FT  = 
MDP-C-MS-1-T-4-FT                    TRAN
MDP-C-MS-1-T-8-FT                    TRAN
MDP-C-MS-1-T-12-FT                    TRAN
MDP-C-MS-1-T-16-FT                    TRAN
MDP-C-MS-1-T-20-FT                    TRAN
MDP-C-MS-1-T-24-FT                    TRAN
MDP-C-MS-1-AF-FT                  AND     HE-MS-1  MDP-C-MS-1-AF-GT1
MDP-C-MS-1-AF-GT1                    OR     MDP-C-MS-1-T-4-GT  MDP-C-MS-1-T-8-GT  MDP-C-MS-1-T-12-GT  MDP-C-MS-1-T-16-GT  MDP-C-MS-1-T-20-GT  MDP-C-MS-1-T-24-GT  
MDP-C-MS-1-T-4-GT                 AND   HE-T-4  MDP-C-MS-1-T-4-FT 
MDP-C-MS-1-T-8-GT                 AND   HE-T-8  MDP-C-MS-1-T-8-FT NOT-MDP-C-MS-1-T-4-AF-GT  
MDP-C-MS-1-T-12-GT                 AND   HE-T-12  MDP-C-MS-1-T-12-FT NOT-MDP-C-MS-1-T-4-AF-GT  NOT-MDP-C-MS-1-T-8-AF-GT  
MDP-C-MS-1-T-16-GT                 AND   HE-T-16  MDP-C-MS-1-T-16-FT NOT-MDP-C-MS-1-T-4-AF-GT  NOT-MDP-C-MS-1-T-8-AF-GT  NOT-MDP-C-MS-1-T-12-AF-GT  
MDP-C-MS-1-T-20-GT                 AND   HE-T-20  MDP-C-MS-1-T-20-FT NOT-MDP-C-MS-1-T-4-AF-GT  NOT-MDP-C-MS-1-T-8-AF-GT  NOT-MDP-C-MS-1-T-12-AF-GT  NOT-MDP-C-MS-1-T-16-AF-GT  
MDP-C-MS-1-T-24-GT                 AND   HE-T-24  MDP-C-MS-1-T-24-FT NOT-MDP-C-MS-1-T-4-AF-GT  NOT-MDP-C-MS-1-T-8-AF-GT  NOT-MDP-C-MS-1-T-12-AF-GT  NOT-MDP-C-MS-1-T-16-AF-GT  NOT-MDP-C-MS-1-T-20-AF-GT  
NOT-MDP-C-MS-1-T-4-AF-GT             NOR   MDP-C-MS-1-T-4-FT
NOT-MDP-C-MS-1-T-8-AF-GT             NOR   MDP-C-MS-1-T-8-FT
NOT-MDP-C-MS-1-T-12-AF-GT             NOR   MDP-C-MS-1-T-12-FT
NOT-MDP-C-MS-1-T-16-AF-GT             NOR   MDP-C-MS-1-T-16-FT
NOT-MDP-C-MS-1-T-20-AF-GT             NOR   MDP-C-MS-1-T-20-FT
NOT-MDP-C-MS-1-T-24-AF-GT             NOR   MDP-C-MS-1-T-24-FT
^EOS
G-PWR,   MDP-C-MS-1-T-4-FT = 
MDP-C-MS-1-T-4-FT =                   OR    MDP-C-AS-1-MS-1-T-4-CE  MDP-C-AS-2-MS-1-T-4-CE  MDP-C-AS-3-MS-1-T-4-CE  
^EOS
G-PWR,   MDP-C-MS-1-T-8-FT = 
MDP-C-MS-1-T-8-FT =                   OR    MDP-C-AS-1-MS-1-T-8-CE  MDP-C-AS-2-MS-1-T-8-CE  MDP-C-AS-3-MS-1-T-8-CE  
^EOS
G-PWR,   MDP-C-MS-1-T-12-FT = 
MDP-C-MS-1-T-12-FT =                   OR    MDP-C-AS-1-MS-1-T-12-CE  MDP-C-AS-2-MS-1-T-12-CE  MDP-C-AS-3-MS-1-T-12-CE  
^EOS
G-PWR,   MDP-C-MS-1-T-16-FT = 
MDP-C-MS-1-T-16-FT =                   OR    MDP-C-AS-1-MS-1-T-16-CE  MDP-C-AS-2-MS-1-T-16-CE  MDP-C-AS-3-MS-1-T-16-CE  
^EOS
G-PWR,   MDP-C-MS-1-T-20-FT = 
MDP-C-MS-1-T-20-FT =                   OR    MDP-C-AS-1-MS-1-T-20-CE  MDP-C-AS-2-MS-1-T-20-CE  MDP-C-AS-3-MS-1-T-20-CE  
^EOS
G-PWR,   MDP-C-MS-1-T-24-FT = 
MDP-C-MS-1-T-24-FT =                   OR    MDP-C-AS-1-MS-1-T-24-CE  MDP-C-AS-2-MS-1-T-24-CE  MDP-C-AS-3-MS-1-T-24-CE  
^EOS
G-PWR,  MDP-C-MS-2-AF-FT  = 
MDP-C-MS-2-T-4-FT                    TRAN
MDP-C-MS-2-T-8-FT                    TRAN
MDP-C-MS-2-T-12-FT                    TRAN
MDP-C-MS-2-T-16-FT                    TRAN
MDP-C-MS-2-T-20-FT                    TRAN
MDP-C-MS-2-T-24-FT                    TRAN
MDP-C-MS-2-AF-FT                  AND     HE-MS-2  MDP-C-MS-2-AF-GT1
MDP-C-MS-2-AF-GT1                    OR     MDP-C-MS-2-T-4-GT  MDP-C-MS-2-T-8-GT  MDP-C-MS-2-T-12-GT  MDP-C-MS-2-T-16-GT  MDP-C-MS-2-T-20-GT  MDP-C-MS-2-T-24-GT  
MDP-C-MS-2-T-4-GT                 AND   HE-T-4  MDP-C-MS-2-T-4-FT 
MDP-C-MS-2-T-8-GT                 AND   HE-T-8  MDP-C-MS-2-T-8-FT NOT-MDP-C-MS-2-T-4-AF-GT  
MDP-C-MS-2-T-12-GT                 AND   HE-T-12  MDP-C-MS-2-T-12-FT NOT-MDP-C-MS-2-T-4-AF-GT  NOT-MDP-C-MS-2-T-8-AF-GT  
MDP-C-MS-2-T-16-GT                 AND   HE-T-16  MDP-C-MS-2-T-16-FT NOT-MDP-C-MS-2-T-4-AF-GT  NOT-MDP-C-MS-2-T-8-AF-GT  NOT-MDP-C-MS-2-T-12-AF-GT  
MDP-C-MS-2-T-20-GT                 AND   HE-T-20  MDP-C-MS-2-T-20-FT NOT-MDP-C-MS-2-T-4-AF-GT  NOT-MDP-C-MS-2-T-8-AF-GT  NOT-MDP-C-MS-2-T-12-AF-GT  NOT-MDP-C-MS-2-T-16-AF-GT  
MDP-C-MS-2-T-24-GT                 AND   HE-T-24  MDP-C-MS-2-T-24-FT NOT-MDP-C-MS-2-T-4-AF-GT  NOT-MDP-C-MS-2-T-8-AF-GT  NOT-MDP-C-MS-2-T-12-AF-GT  NOT-MDP-C-MS-2-T-16-AF-GT  NOT-MDP-C-MS-2-T-20-AF-GT  
NOT-MDP-C-MS-2-T-4-AF-GT             NOR   MDP-C-MS-2-T-4-FT
NOT-MDP-C-MS-2-T-8-AF-GT             NOR   MDP-C-MS-2-T-8-FT
NOT-MDP-C-MS-2-T-12-AF-GT             NOR   MDP-C-MS-2-T-12-FT
NOT-MDP-C-MS-2-T-16-AF-GT             NOR   MDP-C-MS-2-T-16-FT
NOT-MDP-C-MS-2-T-20-AF-GT             NOR   MDP-C-MS-2-T-20-FT
NOT-MDP-C-MS-2-T-24-AF-GT             NOR   MDP-C-MS-2-T-24-FT
^EOS
G-PWR,   MDP-C-MS-2-T-4-FT = 
MDP-C-MS-2-T-4-FT =                   OR    MDP-C-AS-1-MS-2-T-4-CE  MDP-C-AS-2-MS-2-T-4-CE  MDP-C-AS-3-MS-2-T-4-CE  
^EOS
G-PWR,   MDP-C-MS-2-T-8-FT = 
MDP-C-MS-2-T-8-FT =                   OR    MDP-C-AS-1-MS-2-T-8-CE  MDP-C-AS-2-MS-2-T-8-CE  MDP-C-AS-3-MS-2-T-8-CE  
^EOS
G-PWR,   MDP-C-MS-2-T-12-FT = 
MDP-C-MS-2-T-12-FT =                   OR    MDP-C-AS-1-MS-2-T-12-CE  MDP-C-AS-2-MS-2-T-12-CE  MDP-C-AS-3-MS-2-T-12-CE  
^EOS
G-PWR,   MDP-C-MS-2-T-16-FT = 
MDP-C-MS-2-T-16-FT =                   OR    MDP-C-AS-1-MS-2-T-16-CE  MDP-C-AS-2-MS-2-T-16-CE  MDP-C-AS-3-MS-2-T-16-CE  
^EOS
G-PWR,   MDP-C-MS-2-T-20-FT = 
MDP-C-MS-2-T-20-FT =                   OR    MDP-C-AS-1-MS-2-T-20-CE  MDP-C-AS-2-MS-2-T-20-CE  MDP-C-AS-3-MS-2-T-20-CE  
^EOS
G-PWR,   MDP-C-MS-2-T-24-FT = 
MDP-C-MS-2-T-24-FT =                   OR    MDP-C-AS-1-MS-2-T-24-CE  MDP-C-AS-2-MS-2-T-24-CE  MDP-C-AS-3-MS-2-T-24-CE  
^EOS
G-PWR,  MDP-C-MS-3-AF-FT  = 
MDP-C-MS-3-T-4-FT                    TRAN
MDP-C-MS-3-T-8-FT                    TRAN
MDP-C-MS-3-T-12-FT                    TRAN
MDP-C-MS-3-T-16-FT                    TRAN
MDP-C-MS-3-T-20-FT                    TRAN
MDP-C-MS-3-T-24-FT                    TRAN
MDP-C-MS-3-AF-FT                  AND     HE-MS-3  MDP-C-MS-3-AF-GT1
MDP-C-MS-3-AF-GT1                    OR     MDP-C-MS-3-T-4-GT  MDP-C-MS-3-T-8-GT  MDP-C-MS-3-T-12-GT  MDP-C-MS-3-T-16-GT  MDP-C-MS-3-T-20-GT  MDP-C-MS-3-T-24-GT  
MDP-C-MS-3-T-4-GT                 AND   HE-T-4  MDP-C-MS-3-T-4-FT 
MDP-C-MS-3-T-8-GT                 AND   HE-T-8  MDP-C-MS-3-T-8-FT NOT-MDP-C-MS-3-T-4-AF-GT  
MDP-C-MS-3-T-12-GT                 AND   HE-T-12  MDP-C-MS-3-T-12-FT NOT-MDP-C-MS-3-T-4-AF-GT  NOT-MDP-C-MS-3-T-8-AF-GT  
MDP-C-MS-3-T-16-GT                 AND   HE-T-16  MDP-C-MS-3-T-16-FT NOT-MDP-C-MS-3-T-4-AF-GT  NOT-MDP-C-MS-3-T-8-AF-GT  NOT-MDP-C-MS-3-T-12-AF-GT  
MDP-C-MS-3-T-20-GT                 AND   HE-T-20  MDP-C-MS-3-T-20-FT NOT-MDP-C-MS-3-T-4-AF-GT  NOT-MDP-C-MS-3-T-8-AF-GT  NOT-MDP-C-MS-3-T-12-AF-GT  NOT-MDP-C-MS-3-T-16-AF-GT  
MDP-C-MS-3-T-24-GT                 AND   HE-T-24  MDP-C-MS-3-T-24-FT NOT-MDP-C-MS-3-T-4-AF-GT  NOT-MDP-C-MS-3-T-8-AF-GT  NOT-MDP-C-MS-3-T-12-AF-GT  NOT-MDP-C-MS-3-T-16-AF-GT  NOT-MDP-C-MS-3-T-20-AF-GT  
NOT-MDP-C-MS-3-T-4-AF-GT             NOR   MDP-C-MS-3-T-4-FT
NOT-MDP-C-MS-3-T-8-AF-GT             NOR   MDP-C-MS-3-T-8-FT
NOT-MDP-C-MS-3-T-12-AF-GT             NOR   MDP-C-MS-3-T-12-FT
NOT-MDP-C-MS-3-T-16-AF-GT             NOR   MDP-C-MS-3-T-16-FT
NOT-MDP-C-MS-3-T-20-AF-GT             NOR   MDP-C-MS-3-T-20-FT
NOT-MDP-C-MS-3-T-24-AF-GT             NOR   MDP-C-MS-3-T-24-FT
^EOS
G-PWR,   MDP-C-MS-3-T-4-FT = 
MDP-C-MS-3-T-4-FT =                   OR    MDP-C-AS-1-MS-3-T-4-CE  MDP-C-AS-2-MS-3-T-4-CE  MDP-C-AS-3-MS-3-T-4-CE  
^EOS
G-PWR,   MDP-C-MS-3-T-8-FT = 
MDP-C-MS-3-T-8-FT =                   OR    MDP-C-AS-1-MS-3-T-8-CE  MDP-C-AS-2-MS-3-T-8-CE  MDP-C-AS-3-MS-3-T-8-CE  
^EOS
G-PWR,   MDP-C-MS-3-T-12-FT = 
MDP-C-MS-3-T-12-FT =                   OR    MDP-C-AS-1-MS-3-T-12-CE  MDP-C-AS-2-MS-3-T-12-CE  MDP-C-AS-3-MS-3-T-12-CE  
^EOS
G-PWR,   MDP-C-MS-3-T-16-FT = 
MDP-C-MS-3-T-16-FT =                   OR    MDP-C-AS-1-MS-3-T-16-CE  MDP-C-AS-2-MS-3-T-16-CE  MDP-C-AS-3-MS-3-T-16-CE  
^EOS
G-PWR,   MDP-C-MS-3-T-20-FT = 
MDP-C-MS-3-T-20-FT =                   OR    MDP-C-AS-1-MS-3-T-20-CE  MDP-C-AS-2-MS-3-T-20-CE  MDP-C-AS-3-MS-3-T-20-CE  
^EOS
G-PWR,   MDP-C-MS-3-T-24-FT = 
MDP-C-MS-3-T-24-FT =                   OR    MDP-C-AS-1-MS-3-T-24-CE  MDP-C-AS-2-MS-3-T-24-CE  MDP-C-AS-3-MS-3-T-24-CE  
^EOS
G-PWR,  MDP-C-MS-4-AF-FT  = 
MDP-C-MS-4-T-4-FT                    TRAN
MDP-C-MS-4-T-8-FT                    TRAN
MDP-C-MS-4-T-12-FT                    TRAN
MDP-C-MS-4-T-16-FT                    TRAN
MDP-C-MS-4-T-20-FT                    TRAN
MDP-C-MS-4-T-24-FT                    TRAN
MDP-C-MS-4-AF-FT                  AND     HE-MS-4  MDP-C-MS-4-AF-GT1
MDP-C-MS-4-AF-GT1                    OR     MDP-C-MS-4-T-4-GT  MDP-C-MS-4-T-8-GT  MDP-C-MS-4-T-12-GT  MDP-C-MS-4-T-16-GT  MDP-C-MS-4-T-20-GT  MDP-C-MS-4-T-24-GT  
MDP-C-MS-4-T-4-GT                 AND   HE-T-4  MDP-C-MS-4-T-4-FT 
MDP-C-MS-4-T-8-GT                 AND   HE-T-8  MDP-C-MS-4-T-8-FT NOT-MDP-C-MS-4-T-4-AF-GT  
MDP-C-MS-4-T-12-GT                 AND   HE-T-12  MDP-C-MS-4-T-12-FT NOT-MDP-C-MS-4-T-4-AF-GT  NOT-MDP-C-MS-4-T-8-AF-GT  
MDP-C-MS-4-T-16-GT                 AND   HE-T-16  MDP-C-MS-4-T-16-FT NOT-MDP-C-MS-4-T-4-AF-GT  NOT-MDP-C-MS-4-T-8-AF-GT  NOT-MDP-C-MS-4-T-12-AF-GT  
MDP-C-MS-4-T-20-GT                 AND   HE-T-20  MDP-C-MS-4-T-20-FT NOT-MDP-C-MS-4-T-4-AF-GT  NOT-MDP-C-MS-4-T-8-AF-GT  NOT-MDP-C-MS-4-T-12-AF-GT  NOT-MDP-C-MS-4-T-16-AF-GT  
MDP-C-MS-4-T-24-GT                 AND   HE-T-24  MDP-C-MS-4-T-24-FT NOT-MDP-C-MS-4-T-4-AF-GT  NOT-MDP-C-MS-4-T-8-AF-GT  NOT-MDP-C-MS-4-T-12-AF-GT  NOT-MDP-C-MS-4-T-16-AF-GT  NOT-MDP-C-MS-4-T-20-AF-GT  
NOT-MDP-C-MS-4-T-4-AF-GT             NOR   MDP-C-MS-4-T-4-FT
NOT-MDP-C-MS-4-T-8-AF-GT             NOR   MDP-C-MS-4-T-8-FT
NOT-MDP-C-MS-4-T-12-AF-GT             NOR   MDP-C-MS-4-T-12-FT
NOT-MDP-C-MS-4-T-16-AF-GT             NOR   MDP-C-MS-4-T-16-FT
NOT-MDP-C-MS-4-T-20-AF-GT             NOR   MDP-C-MS-4-T-20-FT
NOT-MDP-C-MS-4-T-24-AF-GT             NOR   MDP-C-MS-4-T-24-FT
^EOS
G-PWR,   MDP-C-MS-4-T-4-FT = 
MDP-C-MS-4-T-4-FT =                   OR    MDP-C-AS-1-MS-4-T-4-CE  MDP-C-AS-2-MS-4-T-4-CE  MDP-C-AS-3-MS-4-T-4-CE  
^EOS
G-PWR,   MDP-C-MS-4-T-8-FT = 
MDP-C-MS-4-T-8-FT =                   OR    MDP-C-AS-1-MS-4-T-8-CE  MDP-C-AS-2-MS-4-T-8-CE  MDP-C-AS-3-MS-4-T-8-CE  
^EOS
G-PWR,   MDP-C-MS-4-T-12-FT = 
MDP-C-MS-4-T-12-FT =                   OR    MDP-C-AS-1-MS-4-T-12-CE  MDP-C-AS-2-MS-4-T-12-CE  MDP-C-AS-3-MS-4-T-12-CE  
^EOS
G-PWR,   MDP-C-MS-4-T-16-FT = 
MDP-C-MS-4-T-16-FT =                   OR    MDP-C-AS-1-MS-4-T-16-CE  MDP-C-AS-2-MS-4-T-16-CE  MDP-C-AS-3-MS-4-T-16-CE  
^EOS
G-PWR,   MDP-C-MS-4-T-20-FT = 
MDP-C-MS-4-T-20-FT =                   OR    MDP-C-AS-1-MS-4-T-20-CE  MDP-C-AS-2-MS-4-T-20-CE  MDP-C-AS-3-MS-4-T-20-CE  
^EOS
G-PWR,   MDP-C-MS-4-T-24-FT = 
MDP-C-MS-4-T-24-FT =                   OR    MDP-C-AS-1-MS-4-T-24-CE  MDP-C-AS-2-MS-4-T-24-CE  MDP-C-AS-3-MS-4-T-24-CE  
^EOS
G-PWR,  MDP-C-MS-5-AF-FT  = 
MDP-C-MS-5-T-4-FT                    TRAN
MDP-C-MS-5-T-8-FT                    TRAN
MDP-C-MS-5-T-12-FT                    TRAN
MDP-C-MS-5-T-16-FT                    TRAN
MDP-C-MS-5-T-20-FT                    TRAN
MDP-C-MS-5-T-24-FT                    TRAN
MDP-C-MS-5-AF-FT                  AND     HE-MS-5  MDP-C-MS-5-AF-GT1
MDP-C-MS-5-AF-GT1                    OR     MDP-C-MS-5-T-4-GT  MDP-C-MS-5-T-8-GT  MDP-C-MS-5-T-12-GT  MDP-C-MS-5-T-16-GT  MDP-C-MS-5-T-20-GT  MDP-C-MS-5-T-24-GT  
MDP-C-MS-5-T-4-GT                 AND   HE-T-4  MDP-C-MS-5-T-4-FT 
MDP-C-MS-5-T-8-GT                 AND   HE-T-8  MDP-C-MS-5-T-8-FT NOT-MDP-C-MS-5-T-4-AF-GT  
MDP-C-MS-5-T-12-GT                 AND   HE-T-12  MDP-C-MS-5-T-12-FT NOT-MDP-C-MS-5-T-4-AF-GT  NOT-MDP-C-MS-5-T-8-AF-GT  
MDP-C-MS-5-T-16-GT                 AND   HE-T-16  MDP-C-MS-5-T-16-FT NOT-MDP-C-MS-5-T-4-AF-GT  NOT-MDP-C-MS-5-T-8-AF-GT  NOT-MDP-C-MS-5-T-12-AF-GT  
MDP-C-MS-5-T-20-GT                 AND   HE-T-20  MDP-C-MS-5-T-20-FT NOT-MDP-C-MS-5-T-4-AF-GT  NOT-MDP-C-MS-5-T-8-AF-GT  NOT-MDP-C-MS-5-T-12-AF-GT  NOT-MDP-C-MS-5-T-16-AF-GT  
MDP-C-MS-5-T-24-GT                 AND   HE-T-24  MDP-C-MS-5-T-24-FT NOT-MDP-C-MS-5-T-4-AF-GT  NOT-MDP-C-MS-5-T-8-AF-GT  NOT-MDP-C-MS-5-T-12-AF-GT  NOT-MDP-C-MS-5-T-16-AF-GT  NOT-MDP-C-MS-5-T-20-AF-GT  
NOT-MDP-C-MS-5-T-4-AF-GT             NOR   MDP-C-MS-5-T-4-FT
NOT-MDP-C-MS-5-T-8-AF-GT             NOR   MDP-C-MS-5-T-8-FT
NOT-MDP-C-MS-5-T-12-AF-GT             NOR   MDP-C-MS-5-T-12-FT
NOT-MDP-C-MS-5-T-16-AF-GT             NOR   MDP-C-MS-5-T-16-FT
NOT-MDP-C-MS-5-T-20-AF-GT             NOR   MDP-C-MS-5-T-20-FT
NOT-MDP-C-MS-5-T-24-AF-GT             NOR   MDP-C-MS-5-T-24-FT
^EOS
G-PWR,   MDP-C-MS-5-T-4-FT = 
MDP-C-MS-5-T-4-FT =                   OR    MDP-C-AS-1-MS-5-T-4-CE  MDP-C-AS-2-MS-5-T-4-CE  MDP-C-AS-3-MS-5-T-4-CE  
^EOS
G-PWR,   MDP-C-MS-5-T-8-FT = 
MDP-C-MS-5-T-8-FT =                   OR    MDP-C-AS-1-MS-5-T-8-CE  MDP-C-AS-2-MS-5-T-8-CE  MDP-C-AS-3-MS-5-T-8-CE  
^EOS
G-PWR,   MDP-C-MS-5-T-12-FT = 
MDP-C-MS-5-T-12-FT =                   OR    MDP-C-AS-1-MS-5-T-12-CE  MDP-C-AS-2-MS-5-T-12-CE  MDP-C-AS-3-MS-5-T-12-CE  
^EOS
G-PWR,   MDP-C-MS-5-T-16-FT = 
MDP-C-MS-5-T-16-FT =                   OR    MDP-C-AS-1-MS-5-T-16-CE  MDP-C-AS-2-MS-5-T-16-CE  MDP-C-AS-3-MS-5-T-16-CE  
^EOS
G-PWR,   MDP-C-MS-5-T-20-FT = 
MDP-C-MS-5-T-20-FT =                   OR    MDP-C-AS-1-MS-5-T-20-CE  MDP-C-AS-2-MS-5-T-20-CE  MDP-C-AS-3-MS-5-T-20-CE  
^EOS
G-PWR,   MDP-C-MS-5-T-24-FT = 
MDP-C-MS-5-T-24-FT =                   OR    MDP-C-AS-1-MS-5-T-24-CE  MDP-C-AS-2-MS-5-T-24-CE  MDP-C-AS-3-MS-5-T-24-CE  
^EOS
G-PWR,  MDP-C-MS-6-AF-FT  = 
MDP-C-MS-6-T-4-FT                    TRAN
MDP-C-MS-6-T-8-FT                    TRAN
MDP-C-MS-6-T-12-FT                    TRAN
MDP-C-MS-6-T-16-FT                    TRAN
MDP-C-MS-6-T-20-FT                    TRAN
MDP-C-MS-6-T-24-FT                    TRAN
MDP-C-MS-6-AF-FT                  AND     HE-MS-6  MDP-C-MS-6-AF-GT1
MDP-C-MS-6-AF-GT1                    OR     MDP-C-MS-6-T-4-GT  MDP-C-MS-6-T-8-GT  MDP-C-MS-6-T-12-GT  MDP-C-MS-6-T-16-GT  MDP-C-MS-6-T-20-GT  MDP-C-MS-6-T-24-GT  
MDP-C-MS-6-T-4-GT                 AND   HE-T-4  MDP-C-MS-6-T-4-FT 
MDP-C-MS-6-T-8-GT                 AND   HE-T-8  MDP-C-MS-6-T-8-FT NOT-MDP-C-MS-6-T-4-AF-GT  
MDP-C-MS-6-T-12-GT                 AND   HE-T-12  MDP-C-MS-6-T-12-FT NOT-MDP-C-MS-6-T-4-AF-GT  NOT-MDP-C-MS-6-T-8-AF-GT  
MDP-C-MS-6-T-16-GT                 AND   HE-T-16  MDP-C-MS-6-T-16-FT NOT-MDP-C-MS-6-T-4-AF-GT  NOT-MDP-C-MS-6-T-8-AF-GT  NOT-MDP-C-MS-6-T-12-AF-GT  
MDP-C-MS-6-T-20-GT                 AND   HE-T-20  MDP-C-MS-6-T-20-FT NOT-MDP-C-MS-6-T-4-AF-GT  NOT-MDP-C-MS-6-T-8-AF-GT  NOT-MDP-C-MS-6-T-12-AF-GT  NOT-MDP-C-MS-6-T-16-AF-GT  
MDP-C-MS-6-T-24-GT                 AND   HE-T-24  MDP-C-MS-6-T-24-FT NOT-MDP-C-MS-6-T-4-AF-GT  NOT-MDP-C-MS-6-T-8-AF-GT  NOT-MDP-C-MS-6-T-12-AF-GT  NOT-MDP-C-MS-6-T-16-AF-GT  NOT-MDP-C-MS-6-T-20-AF-GT  
NOT-MDP-C-MS-6-T-4-AF-GT             NOR   MDP-C-MS-6-T-4-FT
NOT-MDP-C-MS-6-T-8-AF-GT             NOR   MDP-C-MS-6-T-8-FT
NOT-MDP-C-MS-6-T-12-AF-GT             NOR   MDP-C-MS-6-T-12-FT
NOT-MDP-C-MS-6-T-16-AF-GT             NOR   MDP-C-MS-6-T-16-FT
NOT-MDP-C-MS-6-T-20-AF-GT             NOR   MDP-C-MS-6-T-20-FT
NOT-MDP-C-MS-6-T-24-AF-GT             NOR   MDP-C-MS-6-T-24-FT
^EOS
G-PWR,   MDP-C-MS-6-T-4-FT = 
MDP-C-MS-6-T-4-FT =                   OR    MDP-C-AS-1-MS-6-T-4-CE  MDP-C-AS-2-MS-6-T-4-CE  MDP-C-AS-3-MS-6-T-4-CE  
^EOS
G-PWR,   MDP-C-MS-6-T-8-FT = 
MDP-C-MS-6-T-8-FT =                   OR    MDP-C-AS-1-MS-6-T-8-CE  MDP-C-AS-2-MS-6-T-8-CE  MDP-C-AS-3-MS-6-T-8-CE  
^EOS
G-PWR,   MDP-C-MS-6-T-12-FT = 
MDP-C-MS-6-T-12-FT =                   OR    MDP-C-AS-1-MS-6-T-12-CE  MDP-C-AS-2-MS-6-T-12-CE  MDP-C-AS-3-MS-6-T-12-CE  
^EOS
G-PWR,   MDP-C-MS-6-T-16-FT = 
MDP-C-MS-6-T-16-FT =                   OR    MDP-C-AS-1-MS-6-T-16-CE  MDP-C-AS-2-MS-6-T-16-CE  MDP-C-AS-3-MS-6-T-16-CE  
^EOS
G-PWR,   MDP-C-MS-6-T-20-FT = 
MDP-C-MS-6-T-20-FT =                   OR    MDP-C-AS-1-MS-6-T-20-CE  MDP-C-AS-2-MS-6-T-20-CE  MDP-C-AS-3-MS-6-T-20-CE  
^EOS
G-PWR,   MDP-C-MS-6-T-24-FT = 
MDP-C-MS-6-T-24-FT =                   OR    MDP-C-AS-1-MS-6-T-24-CE  MDP-C-AS-2-MS-6-T-24-CE  MDP-C-AS-3-MS-6-T-24-CE  
^EOS
G-PWR,  MDP-C-MS-7-AF-FT  = 
MDP-C-MS-7-T-4-FT                    TRAN
MDP-C-MS-7-T-8-FT                    TRAN
MDP-C-MS-7-T-12-FT                    TRAN
MDP-C-MS-7-T-16-FT                    TRAN
MDP-C-MS-7-T-20-FT                    TRAN
MDP-C-MS-7-T-24-FT                    TRAN
MDP-C-MS-7-AF-FT                  AND     HE-MS-7  MDP-C-MS-7-AF-GT1
MDP-C-MS-7-AF-GT1                    OR     MDP-C-MS-7-T-4-GT  MDP-C-MS-7-T-8-GT  MDP-C-MS-7-T-12-GT  MDP-C-MS-7-T-16-GT  MDP-C-MS-7-T-20-GT  MDP-C-MS-7-T-24-GT  
MDP-C-MS-7-T-4-GT                 AND   HE-T-4  MDP-C-MS-7-T-4-FT 
MDP-C-MS-7-T-8-GT                 AND   HE-T-8  MDP-C-MS-7-T-8-FT NOT-MDP-C-MS-7-T-4-AF-GT  
MDP-C-MS-7-T-12-GT                 AND   HE-T-12  MDP-C-MS-7-T-12-FT NOT-MDP-C-MS-7-T-4-AF-GT  NOT-MDP-C-MS-7-T-8-AF-GT  
MDP-C-MS-7-T-16-GT                 AND   HE-T-16  MDP-C-MS-7-T-16-FT NOT-MDP-C-MS-7-T-4-AF-GT  NOT-MDP-C-MS-7-T-8-AF-GT  NOT-MDP-C-MS-7-T-12-AF-GT  
MDP-C-MS-7-T-20-GT                 AND   HE-T-20  MDP-C-MS-7-T-20-FT NOT-MDP-C-MS-7-T-4-AF-GT  NOT-MDP-C-MS-7-T-8-AF-GT  NOT-MDP-C-MS-7-T-12-AF-GT  NOT-MDP-C-MS-7-T-16-AF-GT  
MDP-C-MS-7-T-24-GT                 AND   HE-T-24  MDP-C-MS-7-T-24-FT NOT-MDP-C-MS-7-T-4-AF-GT  NOT-MDP-C-MS-7-T-8-AF-GT  NOT-MDP-C-MS-7-T-12-AF-GT  NOT-MDP-C-MS-7-T-16-AF-GT  NOT-MDP-C-MS-7-T-20-AF-GT  
NOT-MDP-C-MS-7-T-4-AF-GT             NOR   MDP-C-MS-7-T-4-FT
NOT-MDP-C-MS-7-T-8-AF-GT             NOR   MDP-C-MS-7-T-8-FT
NOT-MDP-C-MS-7-T-12-AF-GT             NOR   MDP-C-MS-7-T-12-FT
NOT-MDP-C-MS-7-T-16-AF-GT             NOR   MDP-C-MS-7-T-16-FT
NOT-MDP-C-MS-7-T-20-AF-GT             NOR   MDP-C-MS-7-T-20-FT
NOT-MDP-C-MS-7-T-24-AF-GT             NOR   MDP-C-MS-7-T-24-FT
^EOS
G-PWR,   MDP-C-MS-7-T-4-FT = 
MDP-C-MS-7-T-4-FT =                   OR    MDP-C-AS-1-MS-7-T-4-CE  MDP-C-AS-2-MS-7-T-4-CE  MDP-C-AS-3-MS-7-T-4-CE  
^EOS
G-PWR,   MDP-C-MS-7-T-8-FT = 
MDP-C-MS-7-T-8-FT =                   OR    MDP-C-AS-1-MS-7-T-8-CE  MDP-C-AS-2-MS-7-T-8-CE  MDP-C-AS-3-MS-7-T-8-CE  
^EOS
G-PWR,   MDP-C-MS-7-T-12-FT = 
MDP-C-MS-7-T-12-FT =                   OR    MDP-C-AS-1-MS-7-T-12-CE  MDP-C-AS-2-MS-7-T-12-CE  MDP-C-AS-3-MS-7-T-12-CE  
^EOS
G-PWR,   MDP-C-MS-7-T-16-FT = 
MDP-C-MS-7-T-16-FT =                   OR    MDP-C-AS-1-MS-7-T-16-CE  MDP-C-AS-2-MS-7-T-16-CE  MDP-C-AS-3-MS-7-T-16-CE  
^EOS
G-PWR,   MDP-C-MS-7-T-20-FT = 
MDP-C-MS-7-T-20-FT =                   OR    MDP-C-AS-1-MS-7-T-20-CE  MDP-C-AS-2-MS-7-T-20-CE  MDP-C-AS-3-MS-7-T-20-CE  
^EOS
G-PWR,   MDP-C-MS-7-T-24-FT = 
MDP-C-MS-7-T-24-FT =                   OR    MDP-C-AS-1-MS-7-T-24-CE  MDP-C-AS-2-MS-7-T-24-CE  MDP-C-AS-3-MS-7-T-24-CE  
^EOS
G-PWR,  MDP-D-SEIS-FT =
MDP-D-MS-1-AF-FT                 TRAN
MDP-D-MS-2-AF-FT                 TRAN
MDP-D-MS-3-AF-FT                 TRAN
MDP-D-MS-4-AF-FT                 TRAN
MDP-D-MS-5-AF-FT                 TRAN
MDP-D-MS-6-AF-FT                 TRAN
MDP-D-MS-7-AF-FT                 TRAN
MDP-D-SEIS-FT                      OR  MDP-D-MS-FT  MDP-D-AS-GT
MDP-D-AS-GT                            AND MDP-D-AS-F-GT  NOT-MDP-D-MS-FT 
MDP-D-AS-F-GT                          OR  MDP-D-MS-1-AF-FT  MDP-D-MS-2-AF-FT  MDP-D-MS-3-AF-FT  MDP-D-MS-4-AF-FT  MDP-D-MS-5-AF-FT  MDP-D-MS-6-AF-FT  MDP-D-MS-7-AF-FT  
MDP-D-MS-FT                              TRAN
NOT-MDP-D-MS-FT            NOR MDP-D-MS-FT 
^EOS
G-PWR,  MDP-D-MS-1-AF-FT  = 
MDP-D-MS-1-T-4-FT                    TRAN
MDP-D-MS-1-T-8-FT                    TRAN
MDP-D-MS-1-T-12-FT                    TRAN
MDP-D-MS-1-T-16-FT                    TRAN
MDP-D-MS-1-T-20-FT                    TRAN
MDP-D-MS-1-T-24-FT                    TRAN
MDP-D-MS-1-AF-FT                  AND     HE-MS-1  MDP-D-MS-1-AF-GT1
MDP-D-MS-1-AF-GT1                    OR     MDP-D-MS-1-T-4-GT  MDP-D-MS-1-T-8-GT  MDP-D-MS-1-T-12-GT  MDP-D-MS-1-T-16-GT  MDP-D-MS-1-T-20-GT  MDP-D-MS-1-T-24-GT  
MDP-D-MS-1-T-4-GT                 AND   HE-T-4  MDP-D-MS-1-T-4-FT 
MDP-D-MS-1-T-8-GT                 AND   HE-T-8  MDP-D-MS-1-T-8-FT NOT-MDP-D-MS-1-T-4-AF-GT  
MDP-D-MS-1-T-12-GT                 AND   HE-T-12  MDP-D-MS-1-T-12-FT NOT-MDP-D-MS-1-T-4-AF-GT  NOT-MDP-D-MS-1-T-8-AF-GT  
MDP-D-MS-1-T-16-GT                 AND   HE-T-16  MDP-D-MS-1-T-16-FT NOT-MDP-D-MS-1-T-4-AF-GT  NOT-MDP-D-MS-1-T-8-AF-GT  NOT-MDP-D-MS-1-T-12-AF-GT  
MDP-D-MS-1-T-20-GT                 AND   HE-T-20  MDP-D-MS-1-T-20-FT NOT-MDP-D-MS-1-T-4-AF-GT  NOT-MDP-D-MS-1-T-8-AF-GT  NOT-MDP-D-MS-1-T-12-AF-GT  NOT-MDP-D-MS-1-T-16-AF-GT  
MDP-D-MS-1-T-24-GT                 AND   HE-T-24  MDP-D-MS-1-T-24-FT NOT-MDP-D-MS-1-T-4-AF-GT  NOT-MDP-D-MS-1-T-8-AF-GT  NOT-MDP-D-MS-1-T-12-AF-GT  NOT-MDP-D-MS-1-T-16-AF-GT  NOT-MDP-D-MS-1-T-20-AF-GT  
NOT-MDP-D-MS-1-T-4-AF-GT             NOR   MDP-D-MS-1-T-4-FT
NOT-MDP-D-MS-1-T-8-AF-GT             NOR   MDP-D-MS-1-T-8-FT
NOT-MDP-D-MS-1-T-12-AF-GT             NOR   MDP-D-MS-1-T-12-FT
NOT-MDP-D-MS-1-T-16-AF-GT             NOR   MDP-D-MS-1-T-16-FT
NOT-MDP-D-MS-1-T-20-AF-GT             NOR   MDP-D-MS-1-T-20-FT
NOT-MDP-D-MS-1-T-24-AF-GT             NOR   MDP-D-MS-1-T-24-FT
^EOS
G-PWR,   MDP-D-MS-1-T-4-FT = 
MDP-D-MS-1-T-4-FT =                   OR    MDP-D-AS-1-MS-1-T-4-CE  MDP-D-AS-2-MS-1-T-4-CE  MDP-D-AS-3-MS-1-T-4-CE  
^EOS
G-PWR,   MDP-D-MS-1-T-8-FT = 
MDP-D-MS-1-T-8-FT =                   OR    MDP-D-AS-1-MS-1-T-8-CE  MDP-D-AS-2-MS-1-T-8-CE  MDP-D-AS-3-MS-1-T-8-CE  
^EOS
G-PWR,   MDP-D-MS-1-T-12-FT = 
MDP-D-MS-1-T-12-FT =                   OR    MDP-D-AS-1-MS-1-T-12-CE  MDP-D-AS-2-MS-1-T-12-CE  MDP-D-AS-3-MS-1-T-12-CE  
^EOS
G-PWR,   MDP-D-MS-1-T-16-FT = 
MDP-D-MS-1-T-16-FT =                   OR    MDP-D-AS-1-MS-1-T-16-CE  MDP-D-AS-2-MS-1-T-16-CE  MDP-D-AS-3-MS-1-T-16-CE  
^EOS
G-PWR,   MDP-D-MS-1-T-20-FT = 
MDP-D-MS-1-T-20-FT =                   OR    MDP-D-AS-1-MS-1-T-20-CE  MDP-D-AS-2-MS-1-T-20-CE  MDP-D-AS-3-MS-1-T-20-CE  
^EOS
G-PWR,   MDP-D-MS-1-T-24-FT = 
MDP-D-MS-1-T-24-FT =                   OR    MDP-D-AS-1-MS-1-T-24-CE  MDP-D-AS-2-MS-1-T-24-CE  MDP-D-AS-3-MS-1-T-24-CE  
^EOS
G-PWR,  MDP-D-MS-2-AF-FT  = 
MDP-D-MS-2-T-4-FT                    TRAN
MDP-D-MS-2-T-8-FT                    TRAN
MDP-D-MS-2-T-12-FT                    TRAN
MDP-D-MS-2-T-16-FT                    TRAN
MDP-D-MS-2-T-20-FT                    TRAN
MDP-D-MS-2-T-24-FT                    TRAN
MDP-D-MS-2-AF-FT                  AND     HE-MS-2  MDP-D-MS-2-AF-GT1
MDP-D-MS-2-AF-GT1                    OR     MDP-D-MS-2-T-4-GT  MDP-D-MS-2-T-8-GT  MDP-D-MS-2-T-12-GT  MDP-D-MS-2-T-16-GT  MDP-D-MS-2-T-20-GT  MDP-D-MS-2-T-24-GT  
MDP-D-MS-2-T-4-GT                 AND   HE-T-4  MDP-D-MS-2-T-4-FT 
MDP-D-MS-2-T-8-GT                 AND   HE-T-8  MDP-D-MS-2-T-8-FT NOT-MDP-D-MS-2-T-4-AF-GT  
MDP-D-MS-2-T-12-GT                 AND   HE-T-12  MDP-D-MS-2-T-12-FT NOT-MDP-D-MS-2-T-4-AF-GT  NOT-MDP-D-MS-2-T-8-AF-GT  
MDP-D-MS-2-T-16-GT                 AND   HE-T-16  MDP-D-MS-2-T-16-FT NOT-MDP-D-MS-2-T-4-AF-GT  NOT-MDP-D-MS-2-T-8-AF-GT  NOT-MDP-D-MS-2-T-12-AF-GT  
MDP-D-MS-2-T-20-GT                 AND   HE-T-20  MDP-D-MS-2-T-20-FT NOT-MDP-D-MS-2-T-4-AF-GT  NOT-MDP-D-MS-2-T-8-AF-GT  NOT-MDP-D-MS-2-T-12-AF-GT  NOT-MDP-D-MS-2-T-16-AF-GT  
MDP-D-MS-2-T-24-GT                 AND   HE-T-24  MDP-D-MS-2-T-24-FT NOT-MDP-D-MS-2-T-4-AF-GT  NOT-MDP-D-MS-2-T-8-AF-GT  NOT-MDP-D-MS-2-T-12-AF-GT  NOT-MDP-D-MS-2-T-16-AF-GT  NOT-MDP-D-MS-2-T-20-AF-GT  
NOT-MDP-D-MS-2-T-4-AF-GT             NOR   MDP-D-MS-2-T-4-FT
NOT-MDP-D-MS-2-T-8-AF-GT             NOR   MDP-D-MS-2-T-8-FT
NOT-MDP-D-MS-2-T-12-AF-GT             NOR   MDP-D-MS-2-T-12-FT
NOT-MDP-D-MS-2-T-16-AF-GT             NOR   MDP-D-MS-2-T-16-FT
NOT-MDP-D-MS-2-T-20-AF-GT             NOR   MDP-D-MS-2-T-20-FT
NOT-MDP-D-MS-2-T-24-AF-GT             NOR   MDP-D-MS-2-T-24-FT
^EOS
G-PWR,   MDP-D-MS-2-T-4-FT = 
MDP-D-MS-2-T-4-FT =                   OR    MDP-D-AS-1-MS-2-T-4-CE  MDP-D-AS-2-MS-2-T-4-CE  MDP-D-AS-3-MS-2-T-4-CE  
^EOS
G-PWR,   MDP-D-MS-2-T-8-FT = 
MDP-D-MS-2-T-8-FT =                   OR    MDP-D-AS-1-MS-2-T-8-CE  MDP-D-AS-2-MS-2-T-8-CE  MDP-D-AS-3-MS-2-T-8-CE  
^EOS
G-PWR,   MDP-D-MS-2-T-12-FT = 
MDP-D-MS-2-T-12-FT =                   OR    MDP-D-AS-1-MS-2-T-12-CE  MDP-D-AS-2-MS-2-T-12-CE  MDP-D-AS-3-MS-2-T-12-CE  
^EOS
G-PWR,   MDP-D-MS-2-T-16-FT = 
MDP-D-MS-2-T-16-FT =                   OR    MDP-D-AS-1-MS-2-T-16-CE  MDP-D-AS-2-MS-2-T-16-CE  MDP-D-AS-3-MS-2-T-16-CE  
^EOS
G-PWR,   MDP-D-MS-2-T-20-FT = 
MDP-D-MS-2-T-20-FT =                   OR    MDP-D-AS-1-MS-2-T-20-CE  MDP-D-AS-2-MS-2-T-20-CE  MDP-D-AS-3-MS-2-T-20-CE  
^EOS
G-PWR,   MDP-D-MS-2-T-24-FT = 
MDP-D-MS-2-T-24-FT =                   OR    MDP-D-AS-1-MS-2-T-24-CE  MDP-D-AS-2-MS-2-T-24-CE  MDP-D-AS-3-MS-2-T-24-CE  
^EOS
G-PWR,  MDP-D-MS-3-AF-FT  = 
MDP-D-MS-3-T-4-FT                    TRAN
MDP-D-MS-3-T-8-FT                    TRAN
MDP-D-MS-3-T-12-FT                    TRAN
MDP-D-MS-3-T-16-FT                    TRAN
MDP-D-MS-3-T-20-FT                    TRAN
MDP-D-MS-3-T-24-FT                    TRAN
MDP-D-MS-3-AF-FT                  AND     HE-MS-3  MDP-D-MS-3-AF-GT1
MDP-D-MS-3-AF-GT1                    OR     MDP-D-MS-3-T-4-GT  MDP-D-MS-3-T-8-GT  MDP-D-MS-3-T-12-GT  MDP-D-MS-3-T-16-GT  MDP-D-MS-3-T-20-GT  MDP-D-MS-3-T-24-GT  
MDP-D-MS-3-T-4-GT                 AND   HE-T-4  MDP-D-MS-3-T-4-FT 
MDP-D-MS-3-T-8-GT                 AND   HE-T-8  MDP-D-MS-3-T-8-FT NOT-MDP-D-MS-3-T-4-AF-GT  
MDP-D-MS-3-T-12-GT                 AND   HE-T-12  MDP-D-MS-3-T-12-FT NOT-MDP-D-MS-3-T-4-AF-GT  NOT-MDP-D-MS-3-T-8-AF-GT  
MDP-D-MS-3-T-16-GT                 AND   HE-T-16  MDP-D-MS-3-T-16-FT NOT-MDP-D-MS-3-T-4-AF-GT  NOT-MDP-D-MS-3-T-8-AF-GT  NOT-MDP-D-MS-3-T-12-AF-GT  
MDP-D-MS-3-T-20-GT                 AND   HE-T-20  MDP-D-MS-3-T-20-FT NOT-MDP-D-MS-3-T-4-AF-GT  NOT-MDP-D-MS-3-T-8-AF-GT  NOT-MDP-D-MS-3-T-12-AF-GT  NOT-MDP-D-MS-3-T-16-AF-GT  
MDP-D-MS-3-T-24-GT                 AND   HE-T-24  MDP-D-MS-3-T-24-FT NOT-MDP-D-MS-3-T-4-AF-GT  NOT-MDP-D-MS-3-T-8-AF-GT  NOT-MDP-D-MS-3-T-12-AF-GT  NOT-MDP-D-MS-3-T-16-AF-GT  NOT-MDP-D-MS-3-T-20-AF-GT  
NOT-MDP-D-MS-3-T-4-AF-GT             NOR   MDP-D-MS-3-T-4-FT
NOT-MDP-D-MS-3-T-8-AF-GT             NOR   MDP-D-MS-3-T-8-FT
NOT-MDP-D-MS-3-T-12-AF-GT             NOR   MDP-D-MS-3-T-12-FT
NOT-MDP-D-MS-3-T-16-AF-GT             NOR   MDP-D-MS-3-T-16-FT
NOT-MDP-D-MS-3-T-20-AF-GT             NOR   MDP-D-MS-3-T-20-FT
NOT-MDP-D-MS-3-T-24-AF-GT             NOR   MDP-D-MS-3-T-24-FT
^EOS
G-PWR,   MDP-D-MS-3-T-4-FT = 
MDP-D-MS-3-T-4-FT =                   OR    MDP-D-AS-1-MS-3-T-4-CE  MDP-D-AS-2-MS-3-T-4-CE  MDP-D-AS-3-MS-3-T-4-CE  
^EOS
G-PWR,   MDP-D-MS-3-T-8-FT = 
MDP-D-MS-3-T-8-FT =                   OR    MDP-D-AS-1-MS-3-T-8-CE  MDP-D-AS-2-MS-3-T-8-CE  MDP-D-AS-3-MS-3-T-8-CE  
^EOS
G-PWR,   MDP-D-MS-3-T-12-FT = 
MDP-D-MS-3-T-12-FT =                   OR    MDP-D-AS-1-MS-3-T-12-CE  MDP-D-AS-2-MS-3-T-12-CE  MDP-D-AS-3-MS-3-T-12-CE  
^EOS
G-PWR,   MDP-D-MS-3-T-16-FT = 
MDP-D-MS-3-T-16-FT =                   OR    MDP-D-AS-1-MS-3-T-16-CE  MDP-D-AS-2-MS-3-T-16-CE  MDP-D-AS-3-MS-3-T-16-CE  
^EOS
G-PWR,   MDP-D-MS-3-T-20-FT = 
MDP-D-MS-3-T-20-FT =                   OR    MDP-D-AS-1-MS-3-T-20-CE  MDP-D-AS-2-MS-3-T-20-CE  MDP-D-AS-3-MS-3-T-20-CE  
^EOS
G-PWR,   MDP-D-MS-3-T-24-FT = 
MDP-D-MS-3-T-24-FT =                   OR    MDP-D-AS-1-MS-3-T-24-CE  MDP-D-AS-2-MS-3-T-24-CE  MDP-D-AS-3-MS-3-T-24-CE  
^EOS
G-PWR,  MDP-D-MS-4-AF-FT  = 
MDP-D-MS-4-T-4-FT                    TRAN
MDP-D-MS-4-T-8-FT                    TRAN
MDP-D-MS-4-T-12-FT                    TRAN
MDP-D-MS-4-T-16-FT                    TRAN
MDP-D-MS-4-T-20-FT                    TRAN
MDP-D-MS-4-T-24-FT                    TRAN
MDP-D-MS-4-AF-FT                  AND     HE-MS-4  MDP-D-MS-4-AF-GT1
MDP-D-MS-4-AF-GT1                    OR     MDP-D-MS-4-T-4-GT  MDP-D-MS-4-T-8-GT  MDP-D-MS-4-T-12-GT  MDP-D-MS-4-T-16-GT  MDP-D-MS-4-T-20-GT  MDP-D-MS-4-T-24-GT  
MDP-D-MS-4-T-4-GT                 AND   HE-T-4  MDP-D-MS-4-T-4-FT 
MDP-D-MS-4-T-8-GT                 AND   HE-T-8  MDP-D-MS-4-T-8-FT NOT-MDP-D-MS-4-T-4-AF-GT  
MDP-D-MS-4-T-12-GT                 AND   HE-T-12  MDP-D-MS-4-T-12-FT NOT-MDP-D-MS-4-T-4-AF-GT  NOT-MDP-D-MS-4-T-8-AF-GT  
MDP-D-MS-4-T-16-GT                 AND   HE-T-16  MDP-D-MS-4-T-16-FT NOT-MDP-D-MS-4-T-4-AF-GT  NOT-MDP-D-MS-4-T-8-AF-GT  NOT-MDP-D-MS-4-T-12-AF-GT  
MDP-D-MS-4-T-20-GT                 AND   HE-T-20  MDP-D-MS-4-T-20-FT NOT-MDP-D-MS-4-T-4-AF-GT  NOT-MDP-D-MS-4-T-8-AF-GT  NOT-MDP-D-MS-4-T-12-AF-GT  NOT-MDP-D-MS-4-T-16-AF-GT  
MDP-D-MS-4-T-24-GT                 AND   HE-T-24  MDP-D-MS-4-T-24-FT NOT-MDP-D-MS-4-T-4-AF-GT  NOT-MDP-D-MS-4-T-8-AF-GT  NOT-MDP-D-MS-4-T-12-AF-GT  NOT-MDP-D-MS-4-T-16-AF-GT  NOT-MDP-D-MS-4-T-20-AF-GT  
NOT-MDP-D-MS-4-T-4-AF-GT             NOR   MDP-D-MS-4-T-4-FT
NOT-MDP-D-MS-4-T-8-AF-GT             NOR   MDP-D-MS-4-T-8-FT
NOT-MDP-D-MS-4-T-12-AF-GT             NOR   MDP-D-MS-4-T-12-FT
NOT-MDP-D-MS-4-T-16-AF-GT             NOR   MDP-D-MS-4-T-16-FT
NOT-MDP-D-MS-4-T-20-AF-GT             NOR   MDP-D-MS-4-T-20-FT
NOT-MDP-D-MS-4-T-24-AF-GT             NOR   MDP-D-MS-4-T-24-FT
^EOS
G-PWR,   MDP-D-MS-4-T-4-FT = 
MDP-D-MS-4-T-4-FT =                   OR    MDP-D-AS-1-MS-4-T-4-CE  MDP-D-AS-2-MS-4-T-4-CE  MDP-D-AS-3-MS-4-T-4-CE  
^EOS
G-PWR,   MDP-D-MS-4-T-8-FT = 
MDP-D-MS-4-T-8-FT =                   OR    MDP-D-AS-1-MS-4-T-8-CE  MDP-D-AS-2-MS-4-T-8-CE  MDP-D-AS-3-MS-4-T-8-CE  
^EOS
G-PWR,   MDP-D-MS-4-T-12-FT = 
MDP-D-MS-4-T-12-FT =                   OR    MDP-D-AS-1-MS-4-T-12-CE  MDP-D-AS-2-MS-4-T-12-CE  MDP-D-AS-3-MS-4-T-12-CE  
^EOS
G-PWR,   MDP-D-MS-4-T-16-FT = 
MDP-D-MS-4-T-16-FT =                   OR    MDP-D-AS-1-MS-4-T-16-CE  MDP-D-AS-2-MS-4-T-16-CE  MDP-D-AS-3-MS-4-T-16-CE  
^EOS
G-PWR,   MDP-D-MS-4-T-20-FT = 
MDP-D-MS-4-T-20-FT =                   OR    MDP-D-AS-1-MS-4-T-20-CE  MDP-D-AS-2-MS-4-T-20-CE  MDP-D-AS-3-MS-4-T-20-CE  
^EOS
G-PWR,   MDP-D-MS-4-T-24-FT = 
MDP-D-MS-4-T-24-FT =                   OR    MDP-D-AS-1-MS-4-T-24-CE  MDP-D-AS-2-MS-4-T-24-CE  MDP-D-AS-3-MS-4-T-24-CE  
^EOS
G-PWR,  MDP-D-MS-5-AF-FT  = 
MDP-D-MS-5-T-4-FT                    TRAN
MDP-D-MS-5-T-8-FT                    TRAN
MDP-D-MS-5-T-12-FT                    TRAN
MDP-D-MS-5-T-16-FT                    TRAN
MDP-D-MS-5-T-20-FT                    TRAN
MDP-D-MS-5-T-24-FT                    TRAN
MDP-D-MS-5-AF-FT                  AND     HE-MS-5  MDP-D-MS-5-AF-GT1
MDP-D-MS-5-AF-GT1                    OR     MDP-D-MS-5-T-4-GT  MDP-D-MS-5-T-8-GT  MDP-D-MS-5-T-12-GT  MDP-D-MS-5-T-16-GT  MDP-D-MS-5-T-20-GT  MDP-D-MS-5-T-24-GT  
MDP-D-MS-5-T-4-GT                 AND   HE-T-4  MDP-D-MS-5-T-4-FT 
MDP-D-MS-5-T-8-GT                 AND   HE-T-8  MDP-D-MS-5-T-8-FT NOT-MDP-D-MS-5-T-4-AF-GT  
MDP-D-MS-5-T-12-GT                 AND   HE-T-12  MDP-D-MS-5-T-12-FT NOT-MDP-D-MS-5-T-4-AF-GT  NOT-MDP-D-MS-5-T-8-AF-GT  
MDP-D-MS-5-T-16-GT                 AND   HE-T-16  MDP-D-MS-5-T-16-FT NOT-MDP-D-MS-5-T-4-AF-GT  NOT-MDP-D-MS-5-T-8-AF-GT  NOT-MDP-D-MS-5-T-12-AF-GT  
MDP-D-MS-5-T-20-GT                 AND   HE-T-20  MDP-D-MS-5-T-20-FT NOT-MDP-D-MS-5-T-4-AF-GT  NOT-MDP-D-MS-5-T-8-AF-GT  NOT-MDP-D-MS-5-T-12-AF-GT  NOT-MDP-D-MS-5-T-16-AF-GT  
MDP-D-MS-5-T-24-GT                 AND   HE-T-24  MDP-D-MS-5-T-24-FT NOT-MDP-D-MS-5-T-4-AF-GT  NOT-MDP-D-MS-5-T-8-AF-GT  NOT-MDP-D-MS-5-T-12-AF-GT  NOT-MDP-D-MS-5-T-16-AF-GT  NOT-MDP-D-MS-5-T-20-AF-GT  
NOT-MDP-D-MS-5-T-4-AF-GT             NOR   MDP-D-MS-5-T-4-FT
NOT-MDP-D-MS-5-T-8-AF-GT             NOR   MDP-D-MS-5-T-8-FT
NOT-MDP-D-MS-5-T-12-AF-GT             NOR   MDP-D-MS-5-T-12-FT
NOT-MDP-D-MS-5-T-16-AF-GT             NOR   MDP-D-MS-5-T-16-FT
NOT-MDP-D-MS-5-T-20-AF-GT             NOR   MDP-D-MS-5-T-20-FT
NOT-MDP-D-MS-5-T-24-AF-GT             NOR   MDP-D-MS-5-T-24-FT
^EOS
G-PWR,   MDP-D-MS-5-T-4-FT = 
MDP-D-MS-5-T-4-FT =                   OR    MDP-D-AS-1-MS-5-T-4-CE  MDP-D-AS-2-MS-5-T-4-CE  MDP-D-AS-3-MS-5-T-4-CE  
^EOS
G-PWR,   MDP-D-MS-5-T-8-FT = 
MDP-D-MS-5-T-8-FT =                   OR    MDP-D-AS-1-MS-5-T-8-CE  MDP-D-AS-2-MS-5-T-8-CE  MDP-D-AS-3-MS-5-T-8-CE  
^EOS
G-PWR,   MDP-D-MS-5-T-12-FT = 
MDP-D-MS-5-T-12-FT =                   OR    MDP-D-AS-1-MS-5-T-12-CE  MDP-D-AS-2-MS-5-T-12-CE  MDP-D-AS-3-MS-5-T-12-CE  
^EOS
G-PWR,   MDP-D-MS-5-T-16-FT = 
MDP-D-MS-5-T-16-FT =                   OR    MDP-D-AS-1-MS-5-T-16-CE  MDP-D-AS-2-MS-5-T-16-CE  MDP-D-AS-3-MS-5-T-16-CE  
^EOS
G-PWR,   MDP-D-MS-5-T-20-FT = 
MDP-D-MS-5-T-20-FT =                   OR    MDP-D-AS-1-MS-5-T-20-CE  MDP-D-AS-2-MS-5-T-20-CE  MDP-D-AS-3-MS-5-T-20-CE  
^EOS
G-PWR,   MDP-D-MS-5-T-24-FT = 
MDP-D-MS-5-T-24-FT =                   OR    MDP-D-AS-1-MS-5-T-24-CE  MDP-D-AS-2-MS-5-T-24-CE  MDP-D-AS-3-MS-5-T-24-CE  
^EOS
G-PWR,  MDP-D-MS-6-AF-FT  = 
MDP-D-MS-6-T-4-FT                    TRAN
MDP-D-MS-6-T-8-FT                    TRAN
MDP-D-MS-6-T-12-FT                    TRAN
MDP-D-MS-6-T-16-FT                    TRAN
MDP-D-MS-6-T-20-FT                    TRAN
MDP-D-MS-6-T-24-FT                    TRAN
MDP-D-MS-6-AF-FT                  AND     HE-MS-6  MDP-D-MS-6-AF-GT1
MDP-D-MS-6-AF-GT1                    OR     MDP-D-MS-6-T-4-GT  MDP-D-MS-6-T-8-GT  MDP-D-MS-6-T-12-GT  MDP-D-MS-6-T-16-GT  MDP-D-MS-6-T-20-GT  MDP-D-MS-6-T-24-GT  
MDP-D-MS-6-T-4-GT                 AND   HE-T-4  MDP-D-MS-6-T-4-FT 
MDP-D-MS-6-T-8-GT                 AND   HE-T-8  MDP-D-MS-6-T-8-FT NOT-MDP-D-MS-6-T-4-AF-GT  
MDP-D-MS-6-T-12-GT                 AND   HE-T-12  MDP-D-MS-6-T-12-FT NOT-MDP-D-MS-6-T-4-AF-GT  NOT-MDP-D-MS-6-T-8-AF-GT  
MDP-D-MS-6-T-16-GT                 AND   HE-T-16  MDP-D-MS-6-T-16-FT NOT-MDP-D-MS-6-T-4-AF-GT  NOT-MDP-D-MS-6-T-8-AF-GT  NOT-MDP-D-MS-6-T-12-AF-GT  
MDP-D-MS-6-T-20-GT                 AND   HE-T-20  MDP-D-MS-6-T-20-FT NOT-MDP-D-MS-6-T-4-AF-GT  NOT-MDP-D-MS-6-T-8-AF-GT  NOT-MDP-D-MS-6-T-12-AF-GT  NOT-MDP-D-MS-6-T-16-AF-GT  
MDP-D-MS-6-T-24-GT                 AND   HE-T-24  MDP-D-MS-6-T-24-FT NOT-MDP-D-MS-6-T-4-AF-GT  NOT-MDP-D-MS-6-T-8-AF-GT  NOT-MDP-D-MS-6-T-12-AF-GT  NOT-MDP-D-MS-6-T-16-AF-GT  NOT-MDP-D-MS-6-T-20-AF-GT  
NOT-MDP-D-MS-6-T-4-AF-GT             NOR   MDP-D-MS-6-T-4-FT
NOT-MDP-D-MS-6-T-8-AF-GT             NOR   MDP-D-MS-6-T-8-FT
NOT-MDP-D-MS-6-T-12-AF-GT             NOR   MDP-D-MS-6-T-12-FT
NOT-MDP-D-MS-6-T-16-AF-GT             NOR   MDP-D-MS-6-T-16-FT
NOT-MDP-D-MS-6-T-20-AF-GT             NOR   MDP-D-MS-6-T-20-FT
NOT-MDP-D-MS-6-T-24-AF-GT             NOR   MDP-D-MS-6-T-24-FT
^EOS
G-PWR,   MDP-D-MS-6-T-4-FT = 
MDP-D-MS-6-T-4-FT =                   OR    MDP-D-AS-1-MS-6-T-4-CE  MDP-D-AS-2-MS-6-T-4-CE  MDP-D-AS-3-MS-6-T-4-CE  
^EOS
G-PWR,   MDP-D-MS-6-T-8-FT = 
MDP-D-MS-6-T-8-FT =                   OR    MDP-D-AS-1-MS-6-T-8-CE  MDP-D-AS-2-MS-6-T-8-CE  MDP-D-AS-3-MS-6-T-8-CE  
^EOS
G-PWR,   MDP-D-MS-6-T-12-FT = 
MDP-D-MS-6-T-12-FT =                   OR    MDP-D-AS-1-MS-6-T-12-CE  MDP-D-AS-2-MS-6-T-12-CE  MDP-D-AS-3-MS-6-T-12-CE  
^EOS
G-PWR,   MDP-D-MS-6-T-16-FT = 
MDP-D-MS-6-T-16-FT =                   OR    MDP-D-AS-1-MS-6-T-16-CE  MDP-D-AS-2-MS-6-T-16-CE  MDP-D-AS-3-MS-6-T-16-CE  
^EOS
G-PWR,   MDP-D-MS-6-T-20-FT = 
MDP-D-MS-6-T-20-FT =                   OR    MDP-D-AS-1-MS-6-T-20-CE  MDP-D-AS-2-MS-6-T-20-CE  MDP-D-AS-3-MS-6-T-20-CE  
^EOS
G-PWR,   MDP-D-MS-6-T-24-FT = 
MDP-D-MS-6-T-24-FT =                   OR    MDP-D-AS-1-MS-6-T-24-CE  MDP-D-AS-2-MS-6-T-24-CE  MDP-D-AS-3-MS-6-T-24-CE  
^EOS
G-PWR,  MDP-D-MS-7-AF-FT  = 
MDP-D-MS-7-T-4-FT                    TRAN
MDP-D-MS-7-T-8-FT                    TRAN
MDP-D-MS-7-T-12-FT                    TRAN
MDP-D-MS-7-T-16-FT                    TRAN
MDP-D-MS-7-T-20-FT                    TRAN
MDP-D-MS-7-T-24-FT                    TRAN
MDP-D-MS-7-AF-FT                  AND     HE-MS-7  MDP-D-MS-7-AF-GT1
MDP-D-MS-7-AF-GT1                    OR     MDP-D-MS-7-T-4-GT  MDP-D-MS-7-T-8-GT  MDP-D-MS-7-T-12-GT  MDP-D-MS-7-T-16-GT  MDP-D-MS-7-T-20-GT  MDP-D-MS-7-T-24-GT  
MDP-D-MS-7-T-4-GT                 AND   HE-T-4  MDP-D-MS-7-T-4-FT 
MDP-D-MS-7-T-8-GT                 AND   HE-T-8  MDP-D-MS-7-T-8-FT NOT-MDP-D-MS-7-T-4-AF-GT  
MDP-D-MS-7-T-12-GT                 AND   HE-T-12  MDP-D-MS-7-T-12-FT NOT-MDP-D-MS-7-T-4-AF-GT  NOT-MDP-D-MS-7-T-8-AF-GT  
MDP-D-MS-7-T-16-GT                 AND   HE-T-16  MDP-D-MS-7-T-16-FT NOT-MDP-D-MS-7-T-4-AF-GT  NOT-MDP-D-MS-7-T-8-AF-GT  NOT-MDP-D-MS-7-T-12-AF-GT  
MDP-D-MS-7-T-20-GT                 AND   HE-T-20  MDP-D-MS-7-T-20-FT NOT-MDP-D-MS-7-T-4-AF-GT  NOT-MDP-D-MS-7-T-8-AF-GT  NOT-MDP-D-MS-7-T-12-AF-GT  NOT-MDP-D-MS-7-T-16-AF-GT  
MDP-D-MS-7-T-24-GT                 AND   HE-T-24  MDP-D-MS-7-T-24-FT NOT-MDP-D-MS-7-T-4-AF-GT  NOT-MDP-D-MS-7-T-8-AF-GT  NOT-MDP-D-MS-7-T-12-AF-GT  NOT-MDP-D-MS-7-T-16-AF-GT  NOT-MDP-D-MS-7-T-20-AF-GT  
NOT-MDP-D-MS-7-T-4-AF-GT             NOR   MDP-D-MS-7-T-4-FT
NOT-MDP-D-MS-7-T-8-AF-GT             NOR   MDP-D-MS-7-T-8-FT
NOT-MDP-D-MS-7-T-12-AF-GT             NOR   MDP-D-MS-7-T-12-FT
NOT-MDP-D-MS-7-T-16-AF-GT             NOR   MDP-D-MS-7-T-16-FT
NOT-MDP-D-MS-7-T-20-AF-GT             NOR   MDP-D-MS-7-T-20-FT
NOT-MDP-D-MS-7-T-24-AF-GT             NOR   MDP-D-MS-7-T-24-FT
^EOS
G-PWR,   MDP-D-MS-7-T-4-FT = 
MDP-D-MS-7-T-4-FT =                   OR    MDP-D-AS-1-MS-7-T-4-CE  MDP-D-AS-2-MS-7-T-4-CE  MDP-D-AS-3-MS-7-T-4-CE  
^EOS
G-PWR,   MDP-D-MS-7-T-8-FT = 
MDP-D-MS-7-T-8-FT =                   OR    MDP-D-AS-1-MS-7-T-8-CE  MDP-D-AS-2-MS-7-T-8-CE  MDP-D-AS-3-MS-7-T-8-CE  
^EOS
G-PWR,   MDP-D-MS-7-T-12-FT = 
MDP-D-MS-7-T-12-FT =                   OR    MDP-D-AS-1-MS-7-T-12-CE  MDP-D-AS-2-MS-7-T-12-CE  MDP-D-AS-3-MS-7-T-12-CE  
^EOS
G-PWR,   MDP-D-MS-7-T-16-FT = 
MDP-D-MS-7-T-16-FT =                   OR    MDP-D-AS-1-MS-7-T-16-CE  MDP-D-AS-2-MS-7-T-16-CE  MDP-D-AS-3-MS-7-T-16-CE  
^EOS
G-PWR,   MDP-D-MS-7-T-20-FT = 
MDP-D-MS-7-T-20-FT =                   OR    MDP-D-AS-1-MS-7-T-20-CE  MDP-D-AS-2-MS-7-T-20-CE  MDP-D-AS-3-MS-7-T-20-CE  
^EOS
G-PWR,   MDP-D-MS-7-T-24-FT = 
MDP-D-MS-7-T-24-FT =                   OR    MDP-D-AS-1-MS-7-T-24-CE  MDP-D-AS-2-MS-7-T-24-CE  MDP-D-AS-3-MS-7-T-24-CE  
^EOS
G-PWR,   TDP-A-MS-FT = 
TDP-A-MS-FT            OR  TDP-A-MS-1-GT  TDP-A-MS-2-GT  TDP-A-MS-3-GT  TDP-A-MS-4-GT  TDP-A-MS-5-GT  TDP-A-MS-6-GT  TDP-A-MS-7-GT  
TDP-A-MS-1-GT            AND  HE-MS-1   TDP-A-MS-1  
TDP-A-MS-2-GT            AND  HE-MS-2   TDP-A-MS-2  
TDP-A-MS-3-GT            AND  HE-MS-3   TDP-A-MS-3  
TDP-A-MS-4-GT            AND  HE-MS-4   TDP-A-MS-4  
TDP-A-MS-5-GT            AND  HE-MS-5   TDP-A-MS-5  
TDP-A-MS-6-GT            AND  HE-MS-6   TDP-A-MS-6  
TDP-A-MS-7-GT            AND  HE-MS-7   TDP-A-MS-7  
^EOS
G-PWR,   TDP-B-MS-FT = 
TDP-B-MS-FT            OR  TDP-B-MS-1-GT  TDP-B-MS-2-GT  TDP-B-MS-3-GT  TDP-B-MS-4-GT  TDP-B-MS-5-GT  TDP-B-MS-6-GT  TDP-B-MS-7-GT  
TDP-B-MS-1-GT            AND  HE-MS-1   TDP-B-MS-1  
TDP-B-MS-2-GT            AND  HE-MS-2   TDP-B-MS-2  
TDP-B-MS-3-GT            AND  HE-MS-3   TDP-B-MS-3  
TDP-B-MS-4-GT            AND  HE-MS-4   TDP-B-MS-4  
TDP-B-MS-5-GT            AND  HE-MS-5   TDP-B-MS-5  
TDP-B-MS-6-GT            AND  HE-MS-6   TDP-B-MS-6  
TDP-B-MS-7-GT            AND  HE-MS-7   TDP-B-MS-7  
^EOS
G-PWR,   TDP-C-MS-FT = 
TDP-C-MS-FT            OR  TDP-C-MS-1-GT  TDP-C-MS-2-GT  TDP-C-MS-3-GT  TDP-C-MS-4-GT  TDP-C-MS-5-GT  TDP-C-MS-6-GT  TDP-C-MS-7-GT  
TDP-C-MS-1-GT            AND  HE-MS-1   TDP-C-MS-1  
TDP-C-MS-2-GT            AND  HE-MS-2   TDP-C-MS-2  
TDP-C-MS-3-GT            AND  HE-MS-3   TDP-C-MS-3  
TDP-C-MS-4-GT            AND  HE-MS-4   TDP-C-MS-4  
TDP-C-MS-5-GT            AND  HE-MS-5   TDP-C-MS-5  
TDP-C-MS-6-GT            AND  HE-MS-6   TDP-C-MS-6  
TDP-C-MS-7-GT            AND  HE-MS-7   TDP-C-MS-7  
^EOS
G-PWR,  TDP-A-SEIS-FT =
TDP-A-MS-1-AF-FT                 TRAN
TDP-A-MS-2-AF-FT                 TRAN
TDP-A-MS-3-AF-FT                 TRAN
TDP-A-MS-4-AF-FT                 TRAN
TDP-A-MS-5-AF-FT                 TRAN
TDP-A-MS-6-AF-FT                 TRAN
TDP-A-MS-7-AF-FT                 TRAN
TDP-A-SEIS-FT                      OR  TDP-A-MS-FT  TDP-A-AS-GT
TDP-A-AS-GT                            AND TDP-A-AS-F-GT  NOT-TDP-A-MS-FT 
TDP-A-AS-F-GT                          OR  TDP-A-MS-1-AF-FT  TDP-A-MS-2-AF-FT  TDP-A-MS-3-AF-FT  TDP-A-MS-4-AF-FT  TDP-A-MS-5-AF-FT  TDP-A-MS-6-AF-FT  TDP-A-MS-7-AF-FT  
TDP-A-MS-FT                              TRAN
NOT-TDP-A-MS-FT            NOR TDP-A-MS-FT 
^EOS
G-PWR,  TDP-A-MS-1-AF-FT  = 
TDP-A-MS-1-T-6-FT                    TRAN
TDP-A-MS-1-T-10-FT                    TRAN
TDP-A-MS-1-T-14-FT                    TRAN
TDP-A-MS-1-T-18-FT                    TRAN
TDP-A-MS-1-T-22-FT                    TRAN
TDP-A-MS-1-T-26-FT                    TRAN
TDP-A-MS-1-AF-FT                  AND     HE-MS-1  TDP-A-MS-1-AF-GT1
TDP-A-MS-1-AF-GT1                    OR     TDP-A-MS-1-T-6-GT  TDP-A-MS-1-T-10-GT  TDP-A-MS-1-T-14-GT  TDP-A-MS-1-T-18-GT  TDP-A-MS-1-T-22-GT  TDP-A-MS-1-T-26-GT  
TDP-A-MS-1-T-6-GT                 AND   HE-T-6  TDP-A-MS-1-T-6-FT 
TDP-A-MS-1-T-10-GT                 AND   HE-T-10  TDP-A-MS-1-T-10-FT NOT-TDP-A-MS-1-T-6-AF-GT  
TDP-A-MS-1-T-14-GT                 AND   HE-T-14  TDP-A-MS-1-T-14-FT NOT-TDP-A-MS-1-T-6-AF-GT  NOT-TDP-A-MS-1-T-10-AF-GT  
TDP-A-MS-1-T-18-GT                 AND   HE-T-18  TDP-A-MS-1-T-18-FT NOT-TDP-A-MS-1-T-6-AF-GT  NOT-TDP-A-MS-1-T-10-AF-GT  NOT-TDP-A-MS-1-T-14-AF-GT  
TDP-A-MS-1-T-22-GT                 AND   HE-T-22  TDP-A-MS-1-T-22-FT NOT-TDP-A-MS-1-T-6-AF-GT  NOT-TDP-A-MS-1-T-10-AF-GT  NOT-TDP-A-MS-1-T-14-AF-GT  NOT-TDP-A-MS-1-T-18-AF-GT  
TDP-A-MS-1-T-26-GT                 AND   HE-T-26  TDP-A-MS-1-T-26-FT NOT-TDP-A-MS-1-T-6-AF-GT  NOT-TDP-A-MS-1-T-10-AF-GT  NOT-TDP-A-MS-1-T-14-AF-GT  NOT-TDP-A-MS-1-T-18-AF-GT  NOT-TDP-A-MS-1-T-22-AF-GT  
NOT-TDP-A-MS-1-T-6-AF-GT             NOR   TDP-A-MS-1-T-6-FT
NOT-TDP-A-MS-1-T-10-AF-GT             NOR   TDP-A-MS-1-T-10-FT
NOT-TDP-A-MS-1-T-14-AF-GT             NOR   TDP-A-MS-1-T-14-FT
NOT-TDP-A-MS-1-T-18-AF-GT             NOR   TDP-A-MS-1-T-18-FT
NOT-TDP-A-MS-1-T-22-AF-GT             NOR   TDP-A-MS-1-T-22-FT
NOT-TDP-A-MS-1-T-26-AF-GT             NOR   TDP-A-MS-1-T-26-FT
^EOS
G-PWR,   TDP-A-MS-1-T-6-FT = 
TDP-A-MS-1-T-6-FT =                   OR    TDP-A-AS-1-MS-1-T-6-CE  TDP-A-AS-2-MS-1-T-6-CE  TDP-A-AS-3-MS-1-T-6-CE  
^EOS
G-PWR,   TDP-A-MS-1-T-10-FT = 
TDP-A-MS-1-T-10-FT =                   OR    TDP-A-AS-1-MS-1-T-10-CE  TDP-A-AS-2-MS-1-T-10-CE  TDP-A-AS-3-MS-1-T-10-CE  
^EOS
G-PWR,   TDP-A-MS-1-T-14-FT = 
TDP-A-MS-1-T-14-FT =                   OR    TDP-A-AS-1-MS-1-T-14-CE  TDP-A-AS-2-MS-1-T-14-CE  TDP-A-AS-3-MS-1-T-14-CE  
^EOS
G-PWR,   TDP-A-MS-1-T-18-FT = 
TDP-A-MS-1-T-18-FT =                   OR    TDP-A-AS-1-MS-1-T-18-CE  TDP-A-AS-2-MS-1-T-18-CE  TDP-A-AS-3-MS-1-T-18-CE  
^EOS
G-PWR,   TDP-A-MS-1-T-22-FT = 
TDP-A-MS-1-T-22-FT =                   OR    TDP-A-AS-1-MS-1-T-22-CE  TDP-A-AS-2-MS-1-T-22-CE  TDP-A-AS-3-MS-1-T-22-CE  
^EOS
G-PWR,   TDP-A-MS-1-T-26-FT = 
TDP-A-MS-1-T-26-FT =                   OR    TDP-A-AS-1-MS-1-T-26-CE  TDP-A-AS-2-MS-1-T-26-CE  TDP-A-AS-3-MS-1-T-26-CE  
^EOS
G-PWR,  TDP-A-MS-2-AF-FT  = 
TDP-A-MS-2-T-6-FT                    TRAN
TDP-A-MS-2-T-10-FT                    TRAN
TDP-A-MS-2-T-14-FT                    TRAN
TDP-A-MS-2-T-18-FT                    TRAN
TDP-A-MS-2-T-22-FT                    TRAN
TDP-A-MS-2-T-26-FT                    TRAN
TDP-A-MS-2-AF-FT                  AND     HE-MS-2  TDP-A-MS-2-AF-GT1
TDP-A-MS-2-AF-GT1                    OR     TDP-A-MS-2-T-6-GT  TDP-A-MS-2-T-10-GT  TDP-A-MS-2-T-14-GT  TDP-A-MS-2-T-18-GT  TDP-A-MS-2-T-22-GT  TDP-A-MS-2-T-26-GT  
TDP-A-MS-2-T-6-GT                 AND   HE-T-6  TDP-A-MS-2-T-6-FT 
TDP-A-MS-2-T-10-GT                 AND   HE-T-10  TDP-A-MS-2-T-10-FT NOT-TDP-A-MS-2-T-6-AF-GT  
TDP-A-MS-2-T-14-GT                 AND   HE-T-14  TDP-A-MS-2-T-14-FT NOT-TDP-A-MS-2-T-6-AF-GT  NOT-TDP-A-MS-2-T-10-AF-GT  
TDP-A-MS-2-T-18-GT                 AND   HE-T-18  TDP-A-MS-2-T-18-FT NOT-TDP-A-MS-2-T-6-AF-GT  NOT-TDP-A-MS-2-T-10-AF-GT  NOT-TDP-A-MS-2-T-14-AF-GT  
TDP-A-MS-2-T-22-GT                 AND   HE-T-22  TDP-A-MS-2-T-22-FT NOT-TDP-A-MS-2-T-6-AF-GT  NOT-TDP-A-MS-2-T-10-AF-GT  NOT-TDP-A-MS-2-T-14-AF-GT  NOT-TDP-A-MS-2-T-18-AF-GT  
TDP-A-MS-2-T-26-GT                 AND   HE-T-26  TDP-A-MS-2-T-26-FT NOT-TDP-A-MS-2-T-6-AF-GT  NOT-TDP-A-MS-2-T-10-AF-GT  NOT-TDP-A-MS-2-T-14-AF-GT  NOT-TDP-A-MS-2-T-18-AF-GT  NOT-TDP-A-MS-2-T-22-AF-GT  
NOT-TDP-A-MS-2-T-6-AF-GT             NOR   TDP-A-MS-2-T-6-FT
NOT-TDP-A-MS-2-T-10-AF-GT             NOR   TDP-A-MS-2-T-10-FT
NOT-TDP-A-MS-2-T-14-AF-GT             NOR   TDP-A-MS-2-T-14-FT
NOT-TDP-A-MS-2-T-18-AF-GT             NOR   TDP-A-MS-2-T-18-FT
NOT-TDP-A-MS-2-T-22-AF-GT             NOR   TDP-A-MS-2-T-22-FT
NOT-TDP-A-MS-2-T-26-AF-GT             NOR   TDP-A-MS-2-T-26-FT
^EOS
G-PWR,   TDP-A-MS-2-T-6-FT = 
TDP-A-MS-2-T-6-FT =                   OR    TDP-A-AS-1-MS-2-T-6-CE  TDP-A-AS-2-MS-2-T-6-CE  TDP-A-AS-3-MS-2-T-6-CE  
^EOS
G-PWR,   TDP-A-MS-2-T-10-FT = 
TDP-A-MS-2-T-10-FT =                   OR    TDP-A-AS-1-MS-2-T-10-CE  TDP-A-AS-2-MS-2-T-10-CE  TDP-A-AS-3-MS-2-T-10-CE  
^EOS
G-PWR,   TDP-A-MS-2-T-14-FT = 
TDP-A-MS-2-T-14-FT =                   OR    TDP-A-AS-1-MS-2-T-14-CE  TDP-A-AS-2-MS-2-T-14-CE  TDP-A-AS-3-MS-2-T-14-CE  
^EOS
G-PWR,   TDP-A-MS-2-T-18-FT = 
TDP-A-MS-2-T-18-FT =                   OR    TDP-A-AS-1-MS-2-T-18-CE  TDP-A-AS-2-MS-2-T-18-CE  TDP-A-AS-3-MS-2-T-18-CE  
^EOS
G-PWR,   TDP-A-MS-2-T-22-FT = 
TDP-A-MS-2-T-22-FT =                   OR    TDP-A-AS-1-MS-2-T-22-CE  TDP-A-AS-2-MS-2-T-22-CE  TDP-A-AS-3-MS-2-T-22-CE  
^EOS
G-PWR,   TDP-A-MS-2-T-26-FT = 
TDP-A-MS-2-T-26-FT =                   OR    TDP-A-AS-1-MS-2-T-26-CE  TDP-A-AS-2-MS-2-T-26-CE  TDP-A-AS-3-MS-2-T-26-CE  
^EOS
G-PWR,  TDP-A-MS-3-AF-FT  = 
TDP-A-MS-3-T-6-FT                    TRAN
TDP-A-MS-3-T-10-FT                    TRAN
TDP-A-MS-3-T-14-FT                    TRAN
TDP-A-MS-3-T-18-FT                    TRAN
TDP-A-MS-3-T-22-FT                    TRAN
TDP-A-MS-3-T-26-FT                    TRAN
TDP-A-MS-3-AF-FT                  AND     HE-MS-3  TDP-A-MS-3-AF-GT1
TDP-A-MS-3-AF-GT1                    OR     TDP-A-MS-3-T-6-GT  TDP-A-MS-3-T-10-GT  TDP-A-MS-3-T-14-GT  TDP-A-MS-3-T-18-GT  TDP-A-MS-3-T-22-GT  TDP-A-MS-3-T-26-GT  
TDP-A-MS-3-T-6-GT                 AND   HE-T-6  TDP-A-MS-3-T-6-FT 
TDP-A-MS-3-T-10-GT                 AND   HE-T-10  TDP-A-MS-3-T-10-FT NOT-TDP-A-MS-3-T-6-AF-GT  
TDP-A-MS-3-T-14-GT                 AND   HE-T-14  TDP-A-MS-3-T-14-FT NOT-TDP-A-MS-3-T-6-AF-GT  NOT-TDP-A-MS-3-T-10-AF-GT  
TDP-A-MS-3-T-18-GT                 AND   HE-T-18  TDP-A-MS-3-T-18-FT NOT-TDP-A-MS-3-T-6-AF-GT  NOT-TDP-A-MS-3-T-10-AF-GT  NOT-TDP-A-MS-3-T-14-AF-GT  
TDP-A-MS-3-T-22-GT                 AND   HE-T-22  TDP-A-MS-3-T-22-FT NOT-TDP-A-MS-3-T-6-AF-GT  NOT-TDP-A-MS-3-T-10-AF-GT  NOT-TDP-A-MS-3-T-14-AF-GT  NOT-TDP-A-MS-3-T-18-AF-GT  
TDP-A-MS-3-T-26-GT                 AND   HE-T-26  TDP-A-MS-3-T-26-FT NOT-TDP-A-MS-3-T-6-AF-GT  NOT-TDP-A-MS-3-T-10-AF-GT  NOT-TDP-A-MS-3-T-14-AF-GT  NOT-TDP-A-MS-3-T-18-AF-GT  NOT-TDP-A-MS-3-T-22-AF-GT  
NOT-TDP-A-MS-3-T-6-AF-GT             NOR   TDP-A-MS-3-T-6-FT
NOT-TDP-A-MS-3-T-10-AF-GT             NOR   TDP-A-MS-3-T-10-FT
NOT-TDP-A-MS-3-T-14-AF-GT             NOR   TDP-A-MS-3-T-14-FT
NOT-TDP-A-MS-3-T-18-AF-GT             NOR   TDP-A-MS-3-T-18-FT
NOT-TDP-A-MS-3-T-22-AF-GT             NOR   TDP-A-MS-3-T-22-FT
NOT-TDP-A-MS-3-T-26-AF-GT             NOR   TDP-A-MS-3-T-26-FT
^EOS
G-PWR,   TDP-A-MS-3-T-6-FT = 
TDP-A-MS-3-T-6-FT =                   OR    TDP-A-AS-1-MS-3-T-6-CE  TDP-A-AS-2-MS-3-T-6-CE  TDP-A-AS-3-MS-3-T-6-CE  
^EOS
G-PWR,   TDP-A-MS-3-T-10-FT = 
TDP-A-MS-3-T-10-FT =                   OR    TDP-A-AS-1-MS-3-T-10-CE  TDP-A-AS-2-MS-3-T-10-CE  TDP-A-AS-3-MS-3-T-10-CE  
^EOS
G-PWR,   TDP-A-MS-3-T-14-FT = 
TDP-A-MS-3-T-14-FT =                   OR    TDP-A-AS-1-MS-3-T-14-CE  TDP-A-AS-2-MS-3-T-14-CE  TDP-A-AS-3-MS-3-T-14-CE  
^EOS
G-PWR,   TDP-A-MS-3-T-18-FT = 
TDP-A-MS-3-T-18-FT =                   OR    TDP-A-AS-1-MS-3-T-18-CE  TDP-A-AS-2-MS-3-T-18-CE  TDP-A-AS-3-MS-3-T-18-CE  
^EOS
G-PWR,   TDP-A-MS-3-T-22-FT = 
TDP-A-MS-3-T-22-FT =                   OR    TDP-A-AS-1-MS-3-T-22-CE  TDP-A-AS-2-MS-3-T-22-CE  TDP-A-AS-3-MS-3-T-22-CE  
^EOS
G-PWR,   TDP-A-MS-3-T-26-FT = 
TDP-A-MS-3-T-26-FT =                   OR    TDP-A-AS-1-MS-3-T-26-CE  TDP-A-AS-2-MS-3-T-26-CE  TDP-A-AS-3-MS-3-T-26-CE  
^EOS
G-PWR,  TDP-A-MS-4-AF-FT  = 
TDP-A-MS-4-T-6-FT                    TRAN
TDP-A-MS-4-T-10-FT                    TRAN
TDP-A-MS-4-T-14-FT                    TRAN
TDP-A-MS-4-T-18-FT                    TRAN
TDP-A-MS-4-T-22-FT                    TRAN
TDP-A-MS-4-T-26-FT                    TRAN
TDP-A-MS-4-AF-FT                  AND     HE-MS-4  TDP-A-MS-4-AF-GT1
TDP-A-MS-4-AF-GT1                    OR     TDP-A-MS-4-T-6-GT  TDP-A-MS-4-T-10-GT  TDP-A-MS-4-T-14-GT  TDP-A-MS-4-T-18-GT  TDP-A-MS-4-T-22-GT  TDP-A-MS-4-T-26-GT  
TDP-A-MS-4-T-6-GT                 AND   HE-T-6  TDP-A-MS-4-T-6-FT 
TDP-A-MS-4-T-10-GT                 AND   HE-T-10  TDP-A-MS-4-T-10-FT NOT-TDP-A-MS-4-T-6-AF-GT  
TDP-A-MS-4-T-14-GT                 AND   HE-T-14  TDP-A-MS-4-T-14-FT NOT-TDP-A-MS-4-T-6-AF-GT  NOT-TDP-A-MS-4-T-10-AF-GT  
TDP-A-MS-4-T-18-GT                 AND   HE-T-18  TDP-A-MS-4-T-18-FT NOT-TDP-A-MS-4-T-6-AF-GT  NOT-TDP-A-MS-4-T-10-AF-GT  NOT-TDP-A-MS-4-T-14-AF-GT  
TDP-A-MS-4-T-22-GT                 AND   HE-T-22  TDP-A-MS-4-T-22-FT NOT-TDP-A-MS-4-T-6-AF-GT  NOT-TDP-A-MS-4-T-10-AF-GT  NOT-TDP-A-MS-4-T-14-AF-GT  NOT-TDP-A-MS-4-T-18-AF-GT  
TDP-A-MS-4-T-26-GT                 AND   HE-T-26  TDP-A-MS-4-T-26-FT NOT-TDP-A-MS-4-T-6-AF-GT  NOT-TDP-A-MS-4-T-10-AF-GT  NOT-TDP-A-MS-4-T-14-AF-GT  NOT-TDP-A-MS-4-T-18-AF-GT  NOT-TDP-A-MS-4-T-22-AF-GT  
NOT-TDP-A-MS-4-T-6-AF-GT             NOR   TDP-A-MS-4-T-6-FT
NOT-TDP-A-MS-4-T-10-AF-GT             NOR   TDP-A-MS-4-T-10-FT
NOT-TDP-A-MS-4-T-14-AF-GT             NOR   TDP-A-MS-4-T-14-FT
NOT-TDP-A-MS-4-T-18-AF-GT             NOR   TDP-A-MS-4-T-18-FT
NOT-TDP-A-MS-4-T-22-AF-GT             NOR   TDP-A-MS-4-T-22-FT
NOT-TDP-A-MS-4-T-26-AF-GT             NOR   TDP-A-MS-4-T-26-FT
^EOS
G-PWR,   TDP-A-MS-4-T-6-FT = 
TDP-A-MS-4-T-6-FT =                   OR    TDP-A-AS-1-MS-4-T-6-CE  TDP-A-AS-2-MS-4-T-6-CE  TDP-A-AS-3-MS-4-T-6-CE  
^EOS
G-PWR,   TDP-A-MS-4-T-10-FT = 
TDP-A-MS-4-T-10-FT =                   OR    TDP-A-AS-1-MS-4-T-10-CE  TDP-A-AS-2-MS-4-T-10-CE  TDP-A-AS-3-MS-4-T-10-CE  
^EOS
G-PWR,   TDP-A-MS-4-T-14-FT = 
TDP-A-MS-4-T-14-FT =                   OR    TDP-A-AS-1-MS-4-T-14-CE  TDP-A-AS-2-MS-4-T-14-CE  TDP-A-AS-3-MS-4-T-14-CE  
^EOS
G-PWR,   TDP-A-MS-4-T-18-FT = 
TDP-A-MS-4-T-18-FT =                   OR    TDP-A-AS-1-MS-4-T-18-CE  TDP-A-AS-2-MS-4-T-18-CE  TDP-A-AS-3-MS-4-T-18-CE  
^EOS
G-PWR,   TDP-A-MS-4-T-22-FT = 
TDP-A-MS-4-T-22-FT =                   OR    TDP-A-AS-1-MS-4-T-22-CE  TDP-A-AS-2-MS-4-T-22-CE  TDP-A-AS-3-MS-4-T-22-CE  
^EOS
G-PWR,   TDP-A-MS-4-T-26-FT = 
TDP-A-MS-4-T-26-FT =                   OR    TDP-A-AS-1-MS-4-T-26-CE  TDP-A-AS-2-MS-4-T-26-CE  TDP-A-AS-3-MS-4-T-26-CE  
^EOS
G-PWR,  TDP-A-MS-5-AF-FT  = 
TDP-A-MS-5-T-6-FT                    TRAN
TDP-A-MS-5-T-10-FT                    TRAN
TDP-A-MS-5-T-14-FT                    TRAN
TDP-A-MS-5-T-18-FT                    TRAN
TDP-A-MS-5-T-22-FT                    TRAN
TDP-A-MS-5-T-26-FT                    TRAN
TDP-A-MS-5-AF-FT                  AND     HE-MS-5  TDP-A-MS-5-AF-GT1
TDP-A-MS-5-AF-GT1                    OR     TDP-A-MS-5-T-6-GT  TDP-A-MS-5-T-10-GT  TDP-A-MS-5-T-14-GT  TDP-A-MS-5-T-18-GT  TDP-A-MS-5-T-22-GT  TDP-A-MS-5-T-26-GT  
TDP-A-MS-5-T-6-GT                 AND   HE-T-6  TDP-A-MS-5-T-6-FT 
TDP-A-MS-5-T-10-GT                 AND   HE-T-10  TDP-A-MS-5-T-10-FT NOT-TDP-A-MS-5-T-6-AF-GT  
TDP-A-MS-5-T-14-GT                 AND   HE-T-14  TDP-A-MS-5-T-14-FT NOT-TDP-A-MS-5-T-6-AF-GT  NOT-TDP-A-MS-5-T-10-AF-GT  
TDP-A-MS-5-T-18-GT                 AND   HE-T-18  TDP-A-MS-5-T-18-FT NOT-TDP-A-MS-5-T-6-AF-GT  NOT-TDP-A-MS-5-T-10-AF-GT  NOT-TDP-A-MS-5-T-14-AF-GT  
TDP-A-MS-5-T-22-GT                 AND   HE-T-22  TDP-A-MS-5-T-22-FT NOT-TDP-A-MS-5-T-6-AF-GT  NOT-TDP-A-MS-5-T-10-AF-GT  NOT-TDP-A-MS-5-T-14-AF-GT  NOT-TDP-A-MS-5-T-18-AF-GT  
TDP-A-MS-5-T-26-GT                 AND   HE-T-26  TDP-A-MS-5-T-26-FT NOT-TDP-A-MS-5-T-6-AF-GT  NOT-TDP-A-MS-5-T-10-AF-GT  NOT-TDP-A-MS-5-T-14-AF-GT  NOT-TDP-A-MS-5-T-18-AF-GT  NOT-TDP-A-MS-5-T-22-AF-GT  
NOT-TDP-A-MS-5-T-6-AF-GT             NOR   TDP-A-MS-5-T-6-FT
NOT-TDP-A-MS-5-T-10-AF-GT             NOR   TDP-A-MS-5-T-10-FT
NOT-TDP-A-MS-5-T-14-AF-GT             NOR   TDP-A-MS-5-T-14-FT
NOT-TDP-A-MS-5-T-18-AF-GT             NOR   TDP-A-MS-5-T-18-FT
NOT-TDP-A-MS-5-T-22-AF-GT             NOR   TDP-A-MS-5-T-22-FT
NOT-TDP-A-MS-5-T-26-AF-GT             NOR   TDP-A-MS-5-T-26-FT
^EOS
G-PWR,   TDP-A-MS-5-T-6-FT = 
TDP-A-MS-5-T-6-FT =                   OR    TDP-A-AS-1-MS-5-T-6-CE  TDP-A-AS-2-MS-5-T-6-CE  TDP-A-AS-3-MS-5-T-6-CE  
^EOS
G-PWR,   TDP-A-MS-5-T-10-FT = 
TDP-A-MS-5-T-10-FT =                   OR    TDP-A-AS-1-MS-5-T-10-CE  TDP-A-AS-2-MS-5-T-10-CE  TDP-A-AS-3-MS-5-T-10-CE  
^EOS
G-PWR,   TDP-A-MS-5-T-14-FT = 
TDP-A-MS-5-T-14-FT =                   OR    TDP-A-AS-1-MS-5-T-14-CE  TDP-A-AS-2-MS-5-T-14-CE  TDP-A-AS-3-MS-5-T-14-CE  
^EOS
G-PWR,   TDP-A-MS-5-T-18-FT = 
TDP-A-MS-5-T-18-FT =                   OR    TDP-A-AS-1-MS-5-T-18-CE  TDP-A-AS-2-MS-5-T-18-CE  TDP-A-AS-3-MS-5-T-18-CE  
^EOS
G-PWR,   TDP-A-MS-5-T-22-FT = 
TDP-A-MS-5-T-22-FT =                   OR    TDP-A-AS-1-MS-5-T-22-CE  TDP-A-AS-2-MS-5-T-22-CE  TDP-A-AS-3-MS-5-T-22-CE  
^EOS
G-PWR,   TDP-A-MS-5-T-26-FT = 
TDP-A-MS-5-T-26-FT =                   OR    TDP-A-AS-1-MS-5-T-26-CE  TDP-A-AS-2-MS-5-T-26-CE  TDP-A-AS-3-MS-5-T-26-CE  
^EOS
G-PWR,  TDP-A-MS-6-AF-FT  = 
TDP-A-MS-6-T-6-FT                    TRAN
TDP-A-MS-6-T-10-FT                    TRAN
TDP-A-MS-6-T-14-FT                    TRAN
TDP-A-MS-6-T-18-FT                    TRAN
TDP-A-MS-6-T-22-FT                    TRAN
TDP-A-MS-6-T-26-FT                    TRAN
TDP-A-MS-6-AF-FT                  AND     HE-MS-6  TDP-A-MS-6-AF-GT1
TDP-A-MS-6-AF-GT1                    OR     TDP-A-MS-6-T-6-GT  TDP-A-MS-6-T-10-GT  TDP-A-MS-6-T-14-GT  TDP-A-MS-6-T-18-GT  TDP-A-MS-6-T-22-GT  TDP-A-MS-6-T-26-GT  
TDP-A-MS-6-T-6-GT                 AND   HE-T-6  TDP-A-MS-6-T-6-FT 
TDP-A-MS-6-T-10-GT                 AND   HE-T-10  TDP-A-MS-6-T-10-FT NOT-TDP-A-MS-6-T-6-AF-GT  
TDP-A-MS-6-T-14-GT                 AND   HE-T-14  TDP-A-MS-6-T-14-FT NOT-TDP-A-MS-6-T-6-AF-GT  NOT-TDP-A-MS-6-T-10-AF-GT  
TDP-A-MS-6-T-18-GT                 AND   HE-T-18  TDP-A-MS-6-T-18-FT NOT-TDP-A-MS-6-T-6-AF-GT  NOT-TDP-A-MS-6-T-10-AF-GT  NOT-TDP-A-MS-6-T-14-AF-GT  
TDP-A-MS-6-T-22-GT                 AND   HE-T-22  TDP-A-MS-6-T-22-FT NOT-TDP-A-MS-6-T-6-AF-GT  NOT-TDP-A-MS-6-T-10-AF-GT  NOT-TDP-A-MS-6-T-14-AF-GT  NOT-TDP-A-MS-6-T-18-AF-GT  
TDP-A-MS-6-T-26-GT                 AND   HE-T-26  TDP-A-MS-6-T-26-FT NOT-TDP-A-MS-6-T-6-AF-GT  NOT-TDP-A-MS-6-T-10-AF-GT  NOT-TDP-A-MS-6-T-14-AF-GT  NOT-TDP-A-MS-6-T-18-AF-GT  NOT-TDP-A-MS-6-T-22-AF-GT  
NOT-TDP-A-MS-6-T-6-AF-GT             NOR   TDP-A-MS-6-T-6-FT
NOT-TDP-A-MS-6-T-10-AF-GT             NOR   TDP-A-MS-6-T-10-FT
NOT-TDP-A-MS-6-T-14-AF-GT             NOR   TDP-A-MS-6-T-14-FT
NOT-TDP-A-MS-6-T-18-AF-GT             NOR   TDP-A-MS-6-T-18-FT
NOT-TDP-A-MS-6-T-22-AF-GT             NOR   TDP-A-MS-6-T-22-FT
NOT-TDP-A-MS-6-T-26-AF-GT             NOR   TDP-A-MS-6-T-26-FT
^EOS
G-PWR,   TDP-A-MS-6-T-6-FT = 
TDP-A-MS-6-T-6-FT =                   OR    TDP-A-AS-1-MS-6-T-6-CE  TDP-A-AS-2-MS-6-T-6-CE  TDP-A-AS-3-MS-6-T-6-CE  
^EOS
G-PWR,   TDP-A-MS-6-T-10-FT = 
TDP-A-MS-6-T-10-FT =                   OR    TDP-A-AS-1-MS-6-T-10-CE  TDP-A-AS-2-MS-6-T-10-CE  TDP-A-AS-3-MS-6-T-10-CE  
^EOS
G-PWR,   TDP-A-MS-6-T-14-FT = 
TDP-A-MS-6-T-14-FT =                   OR    TDP-A-AS-1-MS-6-T-14-CE  TDP-A-AS-2-MS-6-T-14-CE  TDP-A-AS-3-MS-6-T-14-CE  
^EOS
G-PWR,   TDP-A-MS-6-T-18-FT = 
TDP-A-MS-6-T-18-FT =                   OR    TDP-A-AS-1-MS-6-T-18-CE  TDP-A-AS-2-MS-6-T-18-CE  TDP-A-AS-3-MS-6-T-18-CE  
^EOS
G-PWR,   TDP-A-MS-6-T-22-FT = 
TDP-A-MS-6-T-22-FT =                   OR    TDP-A-AS-1-MS-6-T-22-CE  TDP-A-AS-2-MS-6-T-22-CE  TDP-A-AS-3-MS-6-T-22-CE  
^EOS
G-PWR,   TDP-A-MS-6-T-26-FT = 
TDP-A-MS-6-T-26-FT =                   OR    TDP-A-AS-1-MS-6-T-26-CE  TDP-A-AS-2-MS-6-T-26-CE  TDP-A-AS-3-MS-6-T-26-CE  
^EOS
G-PWR,  TDP-A-MS-7-AF-FT  = 
TDP-A-MS-7-T-6-FT                    TRAN
TDP-A-MS-7-T-10-FT                    TRAN
TDP-A-MS-7-T-14-FT                    TRAN
TDP-A-MS-7-T-18-FT                    TRAN
TDP-A-MS-7-T-22-FT                    TRAN
TDP-A-MS-7-T-26-FT                    TRAN
TDP-A-MS-7-AF-FT                  AND     HE-MS-7  TDP-A-MS-7-AF-GT1
TDP-A-MS-7-AF-GT1                    OR     TDP-A-MS-7-T-6-GT  TDP-A-MS-7-T-10-GT  TDP-A-MS-7-T-14-GT  TDP-A-MS-7-T-18-GT  TDP-A-MS-7-T-22-GT  TDP-A-MS-7-T-26-GT  
TDP-A-MS-7-T-6-GT                 AND   HE-T-6  TDP-A-MS-7-T-6-FT 
TDP-A-MS-7-T-10-GT                 AND   HE-T-10  TDP-A-MS-7-T-10-FT NOT-TDP-A-MS-7-T-6-AF-GT  
TDP-A-MS-7-T-14-GT                 AND   HE-T-14  TDP-A-MS-7-T-14-FT NOT-TDP-A-MS-7-T-6-AF-GT  NOT-TDP-A-MS-7-T-10-AF-GT  
TDP-A-MS-7-T-18-GT                 AND   HE-T-18  TDP-A-MS-7-T-18-FT NOT-TDP-A-MS-7-T-6-AF-GT  NOT-TDP-A-MS-7-T-10-AF-GT  NOT-TDP-A-MS-7-T-14-AF-GT  
TDP-A-MS-7-T-22-GT                 AND   HE-T-22  TDP-A-MS-7-T-22-FT NOT-TDP-A-MS-7-T-6-AF-GT  NOT-TDP-A-MS-7-T-10-AF-GT  NOT-TDP-A-MS-7-T-14-AF-GT  NOT-TDP-A-MS-7-T-18-AF-GT  
TDP-A-MS-7-T-26-GT                 AND   HE-T-26  TDP-A-MS-7-T-26-FT NOT-TDP-A-MS-7-T-6-AF-GT  NOT-TDP-A-MS-7-T-10-AF-GT  NOT-TDP-A-MS-7-T-14-AF-GT  NOT-TDP-A-MS-7-T-18-AF-GT  NOT-TDP-A-MS-7-T-22-AF-GT  
NOT-TDP-A-MS-7-T-6-AF-GT             NOR   TDP-A-MS-7-T-6-FT
NOT-TDP-A-MS-7-T-10-AF-GT             NOR   TDP-A-MS-7-T-10-FT
NOT-TDP-A-MS-7-T-14-AF-GT             NOR   TDP-A-MS-7-T-14-FT
NOT-TDP-A-MS-7-T-18-AF-GT             NOR   TDP-A-MS-7-T-18-FT
NOT-TDP-A-MS-7-T-22-AF-GT             NOR   TDP-A-MS-7-T-22-FT
NOT-TDP-A-MS-7-T-26-AF-GT             NOR   TDP-A-MS-7-T-26-FT
^EOS
G-PWR,   TDP-A-MS-7-T-6-FT = 
TDP-A-MS-7-T-6-FT =                   OR    TDP-A-AS-1-MS-7-T-6-CE  TDP-A-AS-2-MS-7-T-6-CE  TDP-A-AS-3-MS-7-T-6-CE  
^EOS
G-PWR,   TDP-A-MS-7-T-10-FT = 
TDP-A-MS-7-T-10-FT =                   OR    TDP-A-AS-1-MS-7-T-10-CE  TDP-A-AS-2-MS-7-T-10-CE  TDP-A-AS-3-MS-7-T-10-CE  
^EOS
G-PWR,   TDP-A-MS-7-T-14-FT = 
TDP-A-MS-7-T-14-FT =                   OR    TDP-A-AS-1-MS-7-T-14-CE  TDP-A-AS-2-MS-7-T-14-CE  TDP-A-AS-3-MS-7-T-14-CE  
^EOS
G-PWR,   TDP-A-MS-7-T-18-FT = 
TDP-A-MS-7-T-18-FT =                   OR    TDP-A-AS-1-MS-7-T-18-CE  TDP-A-AS-2-MS-7-T-18-CE  TDP-A-AS-3-MS-7-T-18-CE  
^EOS
G-PWR,   TDP-A-MS-7-T-22-FT = 
TDP-A-MS-7-T-22-FT =                   OR    TDP-A-AS-1-MS-7-T-22-CE  TDP-A-AS-2-MS-7-T-22-CE  TDP-A-AS-3-MS-7-T-22-CE  
^EOS
G-PWR,   TDP-A-MS-7-T-26-FT = 
TDP-A-MS-7-T-26-FT =                   OR    TDP-A-AS-1-MS-7-T-26-CE  TDP-A-AS-2-MS-7-T-26-CE  TDP-A-AS-3-MS-7-T-26-CE  
^EOS
G-PWR,  TDP-B-SEIS-FT =
TDP-B-MS-1-AF-FT                 TRAN
TDP-B-MS-2-AF-FT                 TRAN
TDP-B-MS-3-AF-FT                 TRAN
TDP-B-MS-4-AF-FT                 TRAN
TDP-B-MS-5-AF-FT                 TRAN
TDP-B-MS-6-AF-FT                 TRAN
TDP-B-MS-7-AF-FT                 TRAN
TDP-B-SEIS-FT                      OR  TDP-B-MS-FT  TDP-B-AS-GT
TDP-B-AS-GT                            AND TDP-B-AS-F-GT  NOT-TDP-B-MS-FT 
TDP-B-AS-F-GT                          OR  TDP-B-MS-1-AF-FT  TDP-B-MS-2-AF-FT  TDP-B-MS-3-AF-FT  TDP-B-MS-4-AF-FT  TDP-B-MS-5-AF-FT  TDP-B-MS-6-AF-FT  TDP-B-MS-7-AF-FT  
TDP-B-MS-FT                              TRAN
NOT-TDP-B-MS-FT            NOR TDP-B-MS-FT 
^EOS
G-PWR,  TDP-B-MS-1-AF-FT  = 
TDP-B-MS-1-T-6-FT                    TRAN
TDP-B-MS-1-T-10-FT                    TRAN
TDP-B-MS-1-T-14-FT                    TRAN
TDP-B-MS-1-T-18-FT                    TRAN
TDP-B-MS-1-T-22-FT                    TRAN
TDP-B-MS-1-T-26-FT                    TRAN
TDP-B-MS-1-AF-FT                  AND     HE-MS-1  TDP-B-MS-1-AF-GT1
TDP-B-MS-1-AF-GT1                    OR     TDP-B-MS-1-T-6-GT  TDP-B-MS-1-T-10-GT  TDP-B-MS-1-T-14-GT  TDP-B-MS-1-T-18-GT  TDP-B-MS-1-T-22-GT  TDP-B-MS-1-T-26-GT  
TDP-B-MS-1-T-6-GT                 AND   HE-T-6  TDP-B-MS-1-T-6-FT 
TDP-B-MS-1-T-10-GT                 AND   HE-T-10  TDP-B-MS-1-T-10-FT NOT-TDP-B-MS-1-T-6-AF-GT  
TDP-B-MS-1-T-14-GT                 AND   HE-T-14  TDP-B-MS-1-T-14-FT NOT-TDP-B-MS-1-T-6-AF-GT  NOT-TDP-B-MS-1-T-10-AF-GT  
TDP-B-MS-1-T-18-GT                 AND   HE-T-18  TDP-B-MS-1-T-18-FT NOT-TDP-B-MS-1-T-6-AF-GT  NOT-TDP-B-MS-1-T-10-AF-GT  NOT-TDP-B-MS-1-T-14-AF-GT  
TDP-B-MS-1-T-22-GT                 AND   HE-T-22  TDP-B-MS-1-T-22-FT NOT-TDP-B-MS-1-T-6-AF-GT  NOT-TDP-B-MS-1-T-10-AF-GT  NOT-TDP-B-MS-1-T-14-AF-GT  NOT-TDP-B-MS-1-T-18-AF-GT  
TDP-B-MS-1-T-26-GT                 AND   HE-T-26  TDP-B-MS-1-T-26-FT NOT-TDP-B-MS-1-T-6-AF-GT  NOT-TDP-B-MS-1-T-10-AF-GT  NOT-TDP-B-MS-1-T-14-AF-GT  NOT-TDP-B-MS-1-T-18-AF-GT  NOT-TDP-B-MS-1-T-22-AF-GT  
NOT-TDP-B-MS-1-T-6-AF-GT             NOR   TDP-B-MS-1-T-6-FT
NOT-TDP-B-MS-1-T-10-AF-GT             NOR   TDP-B-MS-1-T-10-FT
NOT-TDP-B-MS-1-T-14-AF-GT             NOR   TDP-B-MS-1-T-14-FT
NOT-TDP-B-MS-1-T-18-AF-GT             NOR   TDP-B-MS-1-T-18-FT
NOT-TDP-B-MS-1-T-22-AF-GT             NOR   TDP-B-MS-1-T-22-FT
NOT-TDP-B-MS-1-T-26-AF-GT             NOR   TDP-B-MS-1-T-26-FT
^EOS
G-PWR,   TDP-B-MS-1-T-6-FT = 
TDP-B-MS-1-T-6-FT =                   OR    TDP-B-AS-1-MS-1-T-6-CE  TDP-B-AS-2-MS-1-T-6-CE  TDP-B-AS-3-MS-1-T-6-CE  
^EOS
G-PWR,   TDP-B-MS-1-T-10-FT = 
TDP-B-MS-1-T-10-FT =                   OR    TDP-B-AS-1-MS-1-T-10-CE  TDP-B-AS-2-MS-1-T-10-CE  TDP-B-AS-3-MS-1-T-10-CE  
^EOS
G-PWR,   TDP-B-MS-1-T-14-FT = 
TDP-B-MS-1-T-14-FT =                   OR    TDP-B-AS-1-MS-1-T-14-CE  TDP-B-AS-2-MS-1-T-14-CE  TDP-B-AS-3-MS-1-T-14-CE  
^EOS
G-PWR,   TDP-B-MS-1-T-18-FT = 
TDP-B-MS-1-T-18-FT =                   OR    TDP-B-AS-1-MS-1-T-18-CE  TDP-B-AS-2-MS-1-T-18-CE  TDP-B-AS-3-MS-1-T-18-CE  
^EOS
G-PWR,   TDP-B-MS-1-T-22-FT = 
TDP-B-MS-1-T-22-FT =                   OR    TDP-B-AS-1-MS-1-T-22-CE  TDP-B-AS-2-MS-1-T-22-CE  TDP-B-AS-3-MS-1-T-22-CE  
^EOS
G-PWR,   TDP-B-MS-1-T-26-FT = 
TDP-B-MS-1-T-26-FT =                   OR    TDP-B-AS-1-MS-1-T-26-CE  TDP-B-AS-2-MS-1-T-26-CE  TDP-B-AS-3-MS-1-T-26-CE  
^EOS
G-PWR,  TDP-B-MS-2-AF-FT  = 
TDP-B-MS-2-T-6-FT                    TRAN
TDP-B-MS-2-T-10-FT                    TRAN
TDP-B-MS-2-T-14-FT                    TRAN
TDP-B-MS-2-T-18-FT                    TRAN
TDP-B-MS-2-T-22-FT                    TRAN
TDP-B-MS-2-T-26-FT                    TRAN
TDP-B-MS-2-AF-FT                  AND     HE-MS-2  TDP-B-MS-2-AF-GT1
TDP-B-MS-2-AF-GT1                    OR     TDP-B-MS-2-T-6-GT  TDP-B-MS-2-T-10-GT  TDP-B-MS-2-T-14-GT  TDP-B-MS-2-T-18-GT  TDP-B-MS-2-T-22-GT  TDP-B-MS-2-T-26-GT  
TDP-B-MS-2-T-6-GT                 AND   HE-T-6  TDP-B-MS-2-T-6-FT 
TDP-B-MS-2-T-10-GT                 AND   HE-T-10  TDP-B-MS-2-T-10-FT NOT-TDP-B-MS-2-T-6-AF-GT  
TDP-B-MS-2-T-14-GT                 AND   HE-T-14  TDP-B-MS-2-T-14-FT NOT-TDP-B-MS-2-T-6-AF-GT  NOT-TDP-B-MS-2-T-10-AF-GT  
TDP-B-MS-2-T-18-GT                 AND   HE-T-18  TDP-B-MS-2-T-18-FT NOT-TDP-B-MS-2-T-6-AF-GT  NOT-TDP-B-MS-2-T-10-AF-GT  NOT-TDP-B-MS-2-T-14-AF-GT  
TDP-B-MS-2-T-22-GT                 AND   HE-T-22  TDP-B-MS-2-T-22-FT NOT-TDP-B-MS-2-T-6-AF-GT  NOT-TDP-B-MS-2-T-10-AF-GT  NOT-TDP-B-MS-2-T-14-AF-GT  NOT-TDP-B-MS-2-T-18-AF-GT  
TDP-B-MS-2-T-26-GT                 AND   HE-T-26  TDP-B-MS-2-T-26-FT NOT-TDP-B-MS-2-T-6-AF-GT  NOT-TDP-B-MS-2-T-10-AF-GT  NOT-TDP-B-MS-2-T-14-AF-GT  NOT-TDP-B-MS-2-T-18-AF-GT  NOT-TDP-B-MS-2-T-22-AF-GT  
NOT-TDP-B-MS-2-T-6-AF-GT             NOR   TDP-B-MS-2-T-6-FT
NOT-TDP-B-MS-2-T-10-AF-GT             NOR   TDP-B-MS-2-T-10-FT
NOT-TDP-B-MS-2-T-14-AF-GT             NOR   TDP-B-MS-2-T-14-FT
NOT-TDP-B-MS-2-T-18-AF-GT             NOR   TDP-B-MS-2-T-18-FT
NOT-TDP-B-MS-2-T-22-AF-GT             NOR   TDP-B-MS-2-T-22-FT
NOT-TDP-B-MS-2-T-26-AF-GT             NOR   TDP-B-MS-2-T-26-FT
^EOS
G-PWR,   TDP-B-MS-2-T-6-FT = 
TDP-B-MS-2-T-6-FT =                   OR    TDP-B-AS-1-MS-2-T-6-CE  TDP-B-AS-2-MS-2-T-6-CE  TDP-B-AS-3-MS-2-T-6-CE  
^EOS
G-PWR,   TDP-B-MS-2-T-10-FT = 
TDP-B-MS-2-T-10-FT =                   OR    TDP-B-AS-1-MS-2-T-10-CE  TDP-B-AS-2-MS-2-T-10-CE  TDP-B-AS-3-MS-2-T-10-CE  
^EOS
G-PWR,   TDP-B-MS-2-T-14-FT = 
TDP-B-MS-2-T-14-FT =                   OR    TDP-B-AS-1-MS-2-T-14-CE  TDP-B-AS-2-MS-2-T-14-CE  TDP-B-AS-3-MS-2-T-14-CE  
^EOS
G-PWR,   TDP-B-MS-2-T-18-FT = 
TDP-B-MS-2-T-18-FT =                   OR    TDP-B-AS-1-MS-2-T-18-CE  TDP-B-AS-2-MS-2-T-18-CE  TDP-B-AS-3-MS-2-T-18-CE  
^EOS
G-PWR,   TDP-B-MS-2-T-22-FT = 
TDP-B-MS-2-T-22-FT =                   OR    TDP-B-AS-1-MS-2-T-22-CE  TDP-B-AS-2-MS-2-T-22-CE  TDP-B-AS-3-MS-2-T-22-CE  
^EOS
G-PWR,   TDP-B-MS-2-T-26-FT = 
TDP-B-MS-2-T-26-FT =                   OR    TDP-B-AS-1-MS-2-T-26-CE  TDP-B-AS-2-MS-2-T-26-CE  TDP-B-AS-3-MS-2-T-26-CE  
^EOS
G-PWR,  TDP-B-MS-3-AF-FT  = 
TDP-B-MS-3-T-6-FT                    TRAN
TDP-B-MS-3-T-10-FT                    TRAN
TDP-B-MS-3-T-14-FT                    TRAN
TDP-B-MS-3-T-18-FT                    TRAN
TDP-B-MS-3-T-22-FT                    TRAN
TDP-B-MS-3-T-26-FT                    TRAN
TDP-B-MS-3-AF-FT                  AND     HE-MS-3  TDP-B-MS-3-AF-GT1
TDP-B-MS-3-AF-GT1                    OR     TDP-B-MS-3-T-6-GT  TDP-B-MS-3-T-10-GT  TDP-B-MS-3-T-14-GT  TDP-B-MS-3-T-18-GT  TDP-B-MS-3-T-22-GT  TDP-B-MS-3-T-26-GT  
TDP-B-MS-3-T-6-GT                 AND   HE-T-6  TDP-B-MS-3-T-6-FT 
TDP-B-MS-3-T-10-GT                 AND   HE-T-10  TDP-B-MS-3-T-10-FT NOT-TDP-B-MS-3-T-6-AF-GT  
TDP-B-MS-3-T-14-GT                 AND   HE-T-14  TDP-B-MS-3-T-14-FT NOT-TDP-B-MS-3-T-6-AF-GT  NOT-TDP-B-MS-3-T-10-AF-GT  
TDP-B-MS-3-T-18-GT                 AND   HE-T-18  TDP-B-MS-3-T-18-FT NOT-TDP-B-MS-3-T-6-AF-GT  NOT-TDP-B-MS-3-T-10-AF-GT  NOT-TDP-B-MS-3-T-14-AF-GT  
TDP-B-MS-3-T-22-GT                 AND   HE-T-22  TDP-B-MS-3-T-22-FT NOT-TDP-B-MS-3-T-6-AF-GT  NOT-TDP-B-MS-3-T-10-AF-GT  NOT-TDP-B-MS-3-T-14-AF-GT  NOT-TDP-B-MS-3-T-18-AF-GT  
TDP-B-MS-3-T-26-GT                 AND   HE-T-26  TDP-B-MS-3-T-26-FT NOT-TDP-B-MS-3-T-6-AF-GT  NOT-TDP-B-MS-3-T-10-AF-GT  NOT-TDP-B-MS-3-T-14-AF-GT  NOT-TDP-B-MS-3-T-18-AF-GT  NOT-TDP-B-MS-3-T-22-AF-GT  
NOT-TDP-B-MS-3-T-6-AF-GT             NOR   TDP-B-MS-3-T-6-FT
NOT-TDP-B-MS-3-T-10-AF-GT             NOR   TDP-B-MS-3-T-10-FT
NOT-TDP-B-MS-3-T-14-AF-GT             NOR   TDP-B-MS-3-T-14-FT
NOT-TDP-B-MS-3-T-18-AF-GT             NOR   TDP-B-MS-3-T-18-FT
NOT-TDP-B-MS-3-T-22-AF-GT             NOR   TDP-B-MS-3-T-22-FT
NOT-TDP-B-MS-3-T-26-AF-GT             NOR   TDP-B-MS-3-T-26-FT
^EOS
G-PWR,   TDP-B-MS-3-T-6-FT = 
TDP-B-MS-3-T-6-FT =                   OR    TDP-B-AS-1-MS-3-T-6-CE  TDP-B-AS-2-MS-3-T-6-CE  TDP-B-AS-3-MS-3-T-6-CE  
^EOS
G-PWR,   TDP-B-MS-3-T-10-FT = 
TDP-B-MS-3-T-10-FT =                   OR    TDP-B-AS-1-MS-3-T-10-CE  TDP-B-AS-2-MS-3-T-10-CE  TDP-B-AS-3-MS-3-T-10-CE  
^EOS
G-PWR,   TDP-B-MS-3-T-14-FT = 
TDP-B-MS-3-T-14-FT =                   OR    TDP-B-AS-1-MS-3-T-14-CE  TDP-B-AS-2-MS-3-T-14-CE  TDP-B-AS-3-MS-3-T-14-CE  
^EOS
G-PWR,   TDP-B-MS-3-T-18-FT = 
TDP-B-MS-3-T-18-FT =                   OR    TDP-B-AS-1-MS-3-T-18-CE  TDP-B-AS-2-MS-3-T-18-CE  TDP-B-AS-3-MS-3-T-18-CE  
^EOS
G-PWR,   TDP-B-MS-3-T-22-FT = 
TDP-B-MS-3-T-22-FT =                   OR    TDP-B-AS-1-MS-3-T-22-CE  TDP-B-AS-2-MS-3-T-22-CE  TDP-B-AS-3-MS-3-T-22-CE  
^EOS
G-PWR,   TDP-B-MS-3-T-26-FT = 
TDP-B-MS-3-T-26-FT =                   OR    TDP-B-AS-1-MS-3-T-26-CE  TDP-B-AS-2-MS-3-T-26-CE  TDP-B-AS-3-MS-3-T-26-CE  
^EOS
G-PWR,  TDP-B-MS-4-AF-FT  = 
TDP-B-MS-4-T-6-FT                    TRAN
TDP-B-MS-4-T-10-FT                    TRAN
TDP-B-MS-4-T-14-FT                    TRAN
TDP-B-MS-4-T-18-FT                    TRAN
TDP-B-MS-4-T-22-FT                    TRAN
TDP-B-MS-4-T-26-FT                    TRAN
TDP-B-MS-4-AF-FT                  AND     HE-MS-4  TDP-B-MS-4-AF-GT1
TDP-B-MS-4-AF-GT1                    OR     TDP-B-MS-4-T-6-GT  TDP-B-MS-4-T-10-GT  TDP-B-MS-4-T-14-GT  TDP-B-MS-4-T-18-GT  TDP-B-MS-4-T-22-GT  TDP-B-MS-4-T-26-GT  
TDP-B-MS-4-T-6-GT                 AND   HE-T-6  TDP-B-MS-4-T-6-FT 
TDP-B-MS-4-T-10-GT                 AND   HE-T-10  TDP-B-MS-4-T-10-FT NOT-TDP-B-MS-4-T-6-AF-GT  
TDP-B-MS-4-T-14-GT                 AND   HE-T-14  TDP-B-MS-4-T-14-FT NOT-TDP-B-MS-4-T-6-AF-GT  NOT-TDP-B-MS-4-T-10-AF-GT  
TDP-B-MS-4-T-18-GT                 AND   HE-T-18  TDP-B-MS-4-T-18-FT NOT-TDP-B-MS-4-T-6-AF-GT  NOT-TDP-B-MS-4-T-10-AF-GT  NOT-TDP-B-MS-4-T-14-AF-GT  
TDP-B-MS-4-T-22-GT                 AND   HE-T-22  TDP-B-MS-4-T-22-FT NOT-TDP-B-MS-4-T-6-AF-GT  NOT-TDP-B-MS-4-T-10-AF-GT  NOT-TDP-B-MS-4-T-14-AF-GT  NOT-TDP-B-MS-4-T-18-AF-GT  
TDP-B-MS-4-T-26-GT                 AND   HE-T-26  TDP-B-MS-4-T-26-FT NOT-TDP-B-MS-4-T-6-AF-GT  NOT-TDP-B-MS-4-T-10-AF-GT  NOT-TDP-B-MS-4-T-14-AF-GT  NOT-TDP-B-MS-4-T-18-AF-GT  NOT-TDP-B-MS-4-T-22-AF-GT  
NOT-TDP-B-MS-4-T-6-AF-GT             NOR   TDP-B-MS-4-T-6-FT
NOT-TDP-B-MS-4-T-10-AF-GT             NOR   TDP-B-MS-4-T-10-FT
NOT-TDP-B-MS-4-T-14-AF-GT             NOR   TDP-B-MS-4-T-14-FT
NOT-TDP-B-MS-4-T-18-AF-GT             NOR   TDP-B-MS-4-T-18-FT
NOT-TDP-B-MS-4-T-22-AF-GT             NOR   TDP-B-MS-4-T-22-FT
NOT-TDP-B-MS-4-T-26-AF-GT             NOR   TDP-B-MS-4-T-26-FT
^EOS
G-PWR,   TDP-B-MS-4-T-6-FT = 
TDP-B-MS-4-T-6-FT =                   OR    TDP-B-AS-1-MS-4-T-6-CE  TDP-B-AS-2-MS-4-T-6-CE  TDP-B-AS-3-MS-4-T-6-CE  
^EOS
G-PWR,   TDP-B-MS-4-T-10-FT = 
TDP-B-MS-4-T-10-FT =                   OR    TDP-B-AS-1-MS-4-T-10-CE  TDP-B-AS-2-MS-4-T-10-CE  TDP-B-AS-3-MS-4-T-10-CE  
^EOS
G-PWR,   TDP-B-MS-4-T-14-FT = 
TDP-B-MS-4-T-14-FT =                   OR    TDP-B-AS-1-MS-4-T-14-CE  TDP-B-AS-2-MS-4-T-14-CE  TDP-B-AS-3-MS-4-T-14-CE  
^EOS
G-PWR,   TDP-B-MS-4-T-18-FT = 
TDP-B-MS-4-T-18-FT =                   OR    TDP-B-AS-1-MS-4-T-18-CE  TDP-B-AS-2-MS-4-T-18-CE  TDP-B-AS-3-MS-4-T-18-CE  
^EOS
G-PWR,   TDP-B-MS-4-T-22-FT = 
TDP-B-MS-4-T-22-FT =                   OR    TDP-B-AS-1-MS-4-T-22-CE  TDP-B-AS-2-MS-4-T-22-CE  TDP-B-AS-3-MS-4-T-22-CE  
^EOS
G-PWR,   TDP-B-MS-4-T-26-FT = 
TDP-B-MS-4-T-26-FT =                   OR    TDP-B-AS-1-MS-4-T-26-CE  TDP-B-AS-2-MS-4-T-26-CE  TDP-B-AS-3-MS-4-T-26-CE  
^EOS
G-PWR,  TDP-B-MS-5-AF-FT  = 
TDP-B-MS-5-T-6-FT                    TRAN
TDP-B-MS-5-T-10-FT                    TRAN
TDP-B-MS-5-T-14-FT                    TRAN
TDP-B-MS-5-T-18-FT                    TRAN
TDP-B-MS-5-T-22-FT                    TRAN
TDP-B-MS-5-T-26-FT                    TRAN
TDP-B-MS-5-AF-FT                  AND     HE-MS-5  TDP-B-MS-5-AF-GT1
TDP-B-MS-5-AF-GT1                    OR     TDP-B-MS-5-T-6-GT  TDP-B-MS-5-T-10-GT  TDP-B-MS-5-T-14-GT  TDP-B-MS-5-T-18-GT  TDP-B-MS-5-T-22-GT  TDP-B-MS-5-T-26-GT  
TDP-B-MS-5-T-6-GT                 AND   HE-T-6  TDP-B-MS-5-T-6-FT 
TDP-B-MS-5-T-10-GT                 AND   HE-T-10  TDP-B-MS-5-T-10-FT NOT-TDP-B-MS-5-T-6-AF-GT  
TDP-B-MS-5-T-14-GT                 AND   HE-T-14  TDP-B-MS-5-T-14-FT NOT-TDP-B-MS-5-T-6-AF-GT  NOT-TDP-B-MS-5-T-10-AF-GT  
TDP-B-MS-5-T-18-GT                 AND   HE-T-18  TDP-B-MS-5-T-18-FT NOT-TDP-B-MS-5-T-6-AF-GT  NOT-TDP-B-MS-5-T-10-AF-GT  NOT-TDP-B-MS-5-T-14-AF-GT  
TDP-B-MS-5-T-22-GT                 AND   HE-T-22  TDP-B-MS-5-T-22-FT NOT-TDP-B-MS-5-T-6-AF-GT  NOT-TDP-B-MS-5-T-10-AF-GT  NOT-TDP-B-MS-5-T-14-AF-GT  NOT-TDP-B-MS-5-T-18-AF-GT  
TDP-B-MS-5-T-26-GT                 AND   HE-T-26  TDP-B-MS-5-T-26-FT NOT-TDP-B-MS-5-T-6-AF-GT  NOT-TDP-B-MS-5-T-10-AF-GT  NOT-TDP-B-MS-5-T-14-AF-GT  NOT-TDP-B-MS-5-T-18-AF-GT  NOT-TDP-B-MS-5-T-22-AF-GT  
NOT-TDP-B-MS-5-T-6-AF-GT             NOR   TDP-B-MS-5-T-6-FT
NOT-TDP-B-MS-5-T-10-AF-GT             NOR   TDP-B-MS-5-T-10-FT
NOT-TDP-B-MS-5-T-14-AF-GT             NOR   TDP-B-MS-5-T-14-FT
NOT-TDP-B-MS-5-T-18-AF-GT             NOR   TDP-B-MS-5-T-18-FT
NOT-TDP-B-MS-5-T-22-AF-GT             NOR   TDP-B-MS-5-T-22-FT
NOT-TDP-B-MS-5-T-26-AF-GT             NOR   TDP-B-MS-5-T-26-FT
^EOS
G-PWR,   TDP-B-MS-5-T-6-FT = 
TDP-B-MS-5-T-6-FT =                   OR    TDP-B-AS-1-MS-5-T-6-CE  TDP-B-AS-2-MS-5-T-6-CE  TDP-B-AS-3-MS-5-T-6-CE  
^EOS
G-PWR,   TDP-B-MS-5-T-10-FT = 
TDP-B-MS-5-T-10-FT =                   OR    TDP-B-AS-1-MS-5-T-10-CE  TDP-B-AS-2-MS-5-T-10-CE  TDP-B-AS-3-MS-5-T-10-CE  
^EOS
G-PWR,   TDP-B-MS-5-T-14-FT = 
TDP-B-MS-5-T-14-FT =                   OR    TDP-B-AS-1-MS-5-T-14-CE  TDP-B-AS-2-MS-5-T-14-CE  TDP-B-AS-3-MS-5-T-14-CE  
^EOS
G-PWR,   TDP-B-MS-5-T-18-FT = 
TDP-B-MS-5-T-18-FT =                   OR    TDP-B-AS-1-MS-5-T-18-CE  TDP-B-AS-2-MS-5-T-18-CE  TDP-B-AS-3-MS-5-T-18-CE  
^EOS
G-PWR,   TDP-B-MS-5-T-22-FT = 
TDP-B-MS-5-T-22-FT =                   OR    TDP-B-AS-1-MS-5-T-22-CE  TDP-B-AS-2-MS-5-T-22-CE  TDP-B-AS-3-MS-5-T-22-CE  
^EOS
G-PWR,   TDP-B-MS-5-T-26-FT = 
TDP-B-MS-5-T-26-FT =                   OR    TDP-B-AS-1-MS-5-T-26-CE  TDP-B-AS-2-MS-5-T-26-CE  TDP-B-AS-3-MS-5-T-26-CE  
^EOS
G-PWR,  TDP-B-MS-6-AF-FT  = 
TDP-B-MS-6-T-6-FT                    TRAN
TDP-B-MS-6-T-10-FT                    TRAN
TDP-B-MS-6-T-14-FT                    TRAN
TDP-B-MS-6-T-18-FT                    TRAN
TDP-B-MS-6-T-22-FT                    TRAN
TDP-B-MS-6-T-26-FT                    TRAN
TDP-B-MS-6-AF-FT                  AND     HE-MS-6  TDP-B-MS-6-AF-GT1
TDP-B-MS-6-AF-GT1                    OR     TDP-B-MS-6-T-6-GT  TDP-B-MS-6-T-10-GT  TDP-B-MS-6-T-14-GT  TDP-B-MS-6-T-18-GT  TDP-B-MS-6-T-22-GT  TDP-B-MS-6-T-26-GT  
TDP-B-MS-6-T-6-GT                 AND   HE-T-6  TDP-B-MS-6-T-6-FT 
TDP-B-MS-6-T-10-GT                 AND   HE-T-10  TDP-B-MS-6-T-10-FT NOT-TDP-B-MS-6-T-6-AF-GT  
TDP-B-MS-6-T-14-GT                 AND   HE-T-14  TDP-B-MS-6-T-14-FT NOT-TDP-B-MS-6-T-6-AF-GT  NOT-TDP-B-MS-6-T-10-AF-GT  
TDP-B-MS-6-T-18-GT                 AND   HE-T-18  TDP-B-MS-6-T-18-FT NOT-TDP-B-MS-6-T-6-AF-GT  NOT-TDP-B-MS-6-T-10-AF-GT  NOT-TDP-B-MS-6-T-14-AF-GT  
TDP-B-MS-6-T-22-GT                 AND   HE-T-22  TDP-B-MS-6-T-22-FT NOT-TDP-B-MS-6-T-6-AF-GT  NOT-TDP-B-MS-6-T-10-AF-GT  NOT-TDP-B-MS-6-T-14-AF-GT  NOT-TDP-B-MS-6-T-18-AF-GT  
TDP-B-MS-6-T-26-GT                 AND   HE-T-26  TDP-B-MS-6-T-26-FT NOT-TDP-B-MS-6-T-6-AF-GT  NOT-TDP-B-MS-6-T-10-AF-GT  NOT-TDP-B-MS-6-T-14-AF-GT  NOT-TDP-B-MS-6-T-18-AF-GT  NOT-TDP-B-MS-6-T-22-AF-GT  
NOT-TDP-B-MS-6-T-6-AF-GT             NOR   TDP-B-MS-6-T-6-FT
NOT-TDP-B-MS-6-T-10-AF-GT             NOR   TDP-B-MS-6-T-10-FT
NOT-TDP-B-MS-6-T-14-AF-GT             NOR   TDP-B-MS-6-T-14-FT
NOT-TDP-B-MS-6-T-18-AF-GT             NOR   TDP-B-MS-6-T-18-FT
NOT-TDP-B-MS-6-T-22-AF-GT             NOR   TDP-B-MS-6-T-22-FT
NOT-TDP-B-MS-6-T-26-AF-GT             NOR   TDP-B-MS-6-T-26-FT
^EOS
G-PWR,   TDP-B-MS-6-T-6-FT = 
TDP-B-MS-6-T-6-FT =                   OR    TDP-B-AS-1-MS-6-T-6-CE  TDP-B-AS-2-MS-6-T-6-CE  TDP-B-AS-3-MS-6-T-6-CE  
^EOS
G-PWR,   TDP-B-MS-6-T-10-FT = 
TDP-B-MS-6-T-10-FT =                   OR    TDP-B-AS-1-MS-6-T-10-CE  TDP-B-AS-2-MS-6-T-10-CE  TDP-B-AS-3-MS-6-T-10-CE  
^EOS
G-PWR,   TDP-B-MS-6-T-14-FT = 
TDP-B-MS-6-T-14-FT =                   OR    TDP-B-AS-1-MS-6-T-14-CE  TDP-B-AS-2-MS-6-T-14-CE  TDP-B-AS-3-MS-6-T-14-CE  
^EOS
G-PWR,   TDP-B-MS-6-T-18-FT = 
TDP-B-MS-6-T-18-FT =                   OR    TDP-B-AS-1-MS-6-T-18-CE  TDP-B-AS-2-MS-6-T-18-CE  TDP-B-AS-3-MS-6-T-18-CE  
^EOS
G-PWR,   TDP-B-MS-6-T-22-FT = 
TDP-B-MS-6-T-22-FT =                   OR    TDP-B-AS-1-MS-6-T-22-CE  TDP-B-AS-2-MS-6-T-22-CE  TDP-B-AS-3-MS-6-T-22-CE  
^EOS
G-PWR,   TDP-B-MS-6-T-26-FT = 
TDP-B-MS-6-T-26-FT =                   OR    TDP-B-AS-1-MS-6-T-26-CE  TDP-B-AS-2-MS-6-T-26-CE  TDP-B-AS-3-MS-6-T-26-CE  
^EOS
G-PWR,  TDP-B-MS-7-AF-FT  = 
TDP-B-MS-7-T-6-FT                    TRAN
TDP-B-MS-7-T-10-FT                    TRAN
TDP-B-MS-7-T-14-FT                    TRAN
TDP-B-MS-7-T-18-FT                    TRAN
TDP-B-MS-7-T-22-FT                    TRAN
TDP-B-MS-7-T-26-FT                    TRAN
TDP-B-MS-7-AF-FT                  AND     HE-MS-7  TDP-B-MS-7-AF-GT1
TDP-B-MS-7-AF-GT1                    OR     TDP-B-MS-7-T-6-GT  TDP-B-MS-7-T-10-GT  TDP-B-MS-7-T-14-GT  TDP-B-MS-7-T-18-GT  TDP-B-MS-7-T-22-GT  TDP-B-MS-7-T-26-GT  
TDP-B-MS-7-T-6-GT                 AND   HE-T-6  TDP-B-MS-7-T-6-FT 
TDP-B-MS-7-T-10-GT                 AND   HE-T-10  TDP-B-MS-7-T-10-FT NOT-TDP-B-MS-7-T-6-AF-GT  
TDP-B-MS-7-T-14-GT                 AND   HE-T-14  TDP-B-MS-7-T-14-FT NOT-TDP-B-MS-7-T-6-AF-GT  NOT-TDP-B-MS-7-T-10-AF-GT  
TDP-B-MS-7-T-18-GT                 AND   HE-T-18  TDP-B-MS-7-T-18-FT NOT-TDP-B-MS-7-T-6-AF-GT  NOT-TDP-B-MS-7-T-10-AF-GT  NOT-TDP-B-MS-7-T-14-AF-GT  
TDP-B-MS-7-T-22-GT                 AND   HE-T-22  TDP-B-MS-7-T-22-FT NOT-TDP-B-MS-7-T-6-AF-GT  NOT-TDP-B-MS-7-T-10-AF-GT  NOT-TDP-B-MS-7-T-14-AF-GT  NOT-TDP-B-MS-7-T-18-AF-GT  
TDP-B-MS-7-T-26-GT                 AND   HE-T-26  TDP-B-MS-7-T-26-FT NOT-TDP-B-MS-7-T-6-AF-GT  NOT-TDP-B-MS-7-T-10-AF-GT  NOT-TDP-B-MS-7-T-14-AF-GT  NOT-TDP-B-MS-7-T-18-AF-GT  NOT-TDP-B-MS-7-T-22-AF-GT  
NOT-TDP-B-MS-7-T-6-AF-GT             NOR   TDP-B-MS-7-T-6-FT
NOT-TDP-B-MS-7-T-10-AF-GT             NOR   TDP-B-MS-7-T-10-FT
NOT-TDP-B-MS-7-T-14-AF-GT             NOR   TDP-B-MS-7-T-14-FT
NOT-TDP-B-MS-7-T-18-AF-GT             NOR   TDP-B-MS-7-T-18-FT
NOT-TDP-B-MS-7-T-22-AF-GT             NOR   TDP-B-MS-7-T-22-FT
NOT-TDP-B-MS-7-T-26-AF-GT             NOR   TDP-B-MS-7-T-26-FT
^EOS
G-PWR,   TDP-B-MS-7-T-6-FT = 
TDP-B-MS-7-T-6-FT =                   OR    TDP-B-AS-1-MS-7-T-6-CE  TDP-B-AS-2-MS-7-T-6-CE  TDP-B-AS-3-MS-7-T-6-CE  
^EOS
G-PWR,   TDP-B-MS-7-T-10-FT = 
TDP-B-MS-7-T-10-FT =                   OR    TDP-B-AS-1-MS-7-T-10-CE  TDP-B-AS-2-MS-7-T-10-CE  TDP-B-AS-3-MS-7-T-10-CE  
^EOS
G-PWR,   TDP-B-MS-7-T-14-FT = 
TDP-B-MS-7-T-14-FT =                   OR    TDP-B-AS-1-MS-7-T-14-CE  TDP-B-AS-2-MS-7-T-14-CE  TDP-B-AS-3-MS-7-T-14-CE  
^EOS
G-PWR,   TDP-B-MS-7-T-18-FT = 
TDP-B-MS-7-T-18-FT =                   OR    TDP-B-AS-1-MS-7-T-18-CE  TDP-B-AS-2-MS-7-T-18-CE  TDP-B-AS-3-MS-7-T-18-CE  
^EOS
G-PWR,   TDP-B-MS-7-T-22-FT = 
TDP-B-MS-7-T-22-FT =                   OR    TDP-B-AS-1-MS-7-T-22-CE  TDP-B-AS-2-MS-7-T-22-CE  TDP-B-AS-3-MS-7-T-22-CE  
^EOS
G-PWR,   TDP-B-MS-7-T-26-FT = 
TDP-B-MS-7-T-26-FT =                   OR    TDP-B-AS-1-MS-7-T-26-CE  TDP-B-AS-2-MS-7-T-26-CE  TDP-B-AS-3-MS-7-T-26-CE  
^EOS
G-PWR,  TDP-C-SEIS-FT =
TDP-C-MS-1-AF-FT                 TRAN
TDP-C-MS-2-AF-FT                 TRAN
TDP-C-MS-3-AF-FT                 TRAN
TDP-C-MS-4-AF-FT                 TRAN
TDP-C-MS-5-AF-FT                 TRAN
TDP-C-MS-6-AF-FT                 TRAN
TDP-C-MS-7-AF-FT                 TRAN
TDP-C-SEIS-FT                      OR  TDP-C-MS-FT  TDP-C-AS-GT
TDP-C-AS-GT                            AND TDP-C-AS-F-GT  NOT-TDP-C-MS-FT 
TDP-C-AS-F-GT                          OR  TDP-C-MS-1-AF-FT  TDP-C-MS-2-AF-FT  TDP-C-MS-3-AF-FT  TDP-C-MS-4-AF-FT  TDP-C-MS-5-AF-FT  TDP-C-MS-6-AF-FT  TDP-C-MS-7-AF-FT  
TDP-C-MS-FT                              TRAN
NOT-TDP-C-MS-FT            NOR TDP-C-MS-FT 
^EOS
G-PWR,  TDP-C-MS-1-AF-FT  = 
TDP-C-MS-1-T-6-FT                    TRAN
TDP-C-MS-1-T-10-FT                    TRAN
TDP-C-MS-1-T-14-FT                    TRAN
TDP-C-MS-1-T-18-FT                    TRAN
TDP-C-MS-1-T-22-FT                    TRAN
TDP-C-MS-1-T-26-FT                    TRAN
TDP-C-MS-1-AF-FT                  AND     HE-MS-1  TDP-C-MS-1-AF-GT1
TDP-C-MS-1-AF-GT1                    OR     TDP-C-MS-1-T-6-GT  TDP-C-MS-1-T-10-GT  TDP-C-MS-1-T-14-GT  TDP-C-MS-1-T-18-GT  TDP-C-MS-1-T-22-GT  TDP-C-MS-1-T-26-GT  
TDP-C-MS-1-T-6-GT                 AND   HE-T-6  TDP-C-MS-1-T-6-FT 
TDP-C-MS-1-T-10-GT                 AND   HE-T-10  TDP-C-MS-1-T-10-FT NOT-TDP-C-MS-1-T-6-AF-GT  
TDP-C-MS-1-T-14-GT                 AND   HE-T-14  TDP-C-MS-1-T-14-FT NOT-TDP-C-MS-1-T-6-AF-GT  NOT-TDP-C-MS-1-T-10-AF-GT  
TDP-C-MS-1-T-18-GT                 AND   HE-T-18  TDP-C-MS-1-T-18-FT NOT-TDP-C-MS-1-T-6-AF-GT  NOT-TDP-C-MS-1-T-10-AF-GT  NOT-TDP-C-MS-1-T-14-AF-GT  
TDP-C-MS-1-T-22-GT                 AND   HE-T-22  TDP-C-MS-1-T-22-FT NOT-TDP-C-MS-1-T-6-AF-GT  NOT-TDP-C-MS-1-T-10-AF-GT  NOT-TDP-C-MS-1-T-14-AF-GT  NOT-TDP-C-MS-1-T-18-AF-GT  
TDP-C-MS-1-T-26-GT                 AND   HE-T-26  TDP-C-MS-1-T-26-FT NOT-TDP-C-MS-1-T-6-AF-GT  NOT-TDP-C-MS-1-T-10-AF-GT  NOT-TDP-C-MS-1-T-14-AF-GT  NOT-TDP-C-MS-1-T-18-AF-GT  NOT-TDP-C-MS-1-T-22-AF-GT  
NOT-TDP-C-MS-1-T-6-AF-GT             NOR   TDP-C-MS-1-T-6-FT
NOT-TDP-C-MS-1-T-10-AF-GT             NOR   TDP-C-MS-1-T-10-FT
NOT-TDP-C-MS-1-T-14-AF-GT             NOR   TDP-C-MS-1-T-14-FT
NOT-TDP-C-MS-1-T-18-AF-GT             NOR   TDP-C-MS-1-T-18-FT
NOT-TDP-C-MS-1-T-22-AF-GT             NOR   TDP-C-MS-1-T-22-FT
NOT-TDP-C-MS-1-T-26-AF-GT             NOR   TDP-C-MS-1-T-26-FT
^EOS
G-PWR,   TDP-C-MS-1-T-6-FT = 
TDP-C-MS-1-T-6-FT =                   OR    TDP-C-AS-1-MS-1-T-6-CE  TDP-C-AS-2-MS-1-T-6-CE  TDP-C-AS-3-MS-1-T-6-CE  
^EOS
G-PWR,   TDP-C-MS-1-T-10-FT = 
TDP-C-MS-1-T-10-FT =                   OR    TDP-C-AS-1-MS-1-T-10-CE  TDP-C-AS-2-MS-1-T-10-CE  TDP-C-AS-3-MS-1-T-10-CE  
^EOS
G-PWR,   TDP-C-MS-1-T-14-FT = 
TDP-C-MS-1-T-14-FT =                   OR    TDP-C-AS-1-MS-1-T-14-CE  TDP-C-AS-2-MS-1-T-14-CE  TDP-C-AS-3-MS-1-T-14-CE  
^EOS
G-PWR,   TDP-C-MS-1-T-18-FT = 
TDP-C-MS-1-T-18-FT =                   OR    TDP-C-AS-1-MS-1-T-18-CE  TDP-C-AS-2-MS-1-T-18-CE  TDP-C-AS-3-MS-1-T-18-CE  
^EOS
G-PWR,   TDP-C-MS-1-T-22-FT = 
TDP-C-MS-1-T-22-FT =                   OR    TDP-C-AS-1-MS-1-T-22-CE  TDP-C-AS-2-MS-1-T-22-CE  TDP-C-AS-3-MS-1-T-22-CE  
^EOS
G-PWR,   TDP-C-MS-1-T-26-FT = 
TDP-C-MS-1-T-26-FT =                   OR    TDP-C-AS-1-MS-1-T-26-CE  TDP-C-AS-2-MS-1-T-26-CE  TDP-C-AS-3-MS-1-T-26-CE  
^EOS
G-PWR,  TDP-C-MS-2-AF-FT  = 
TDP-C-MS-2-T-6-FT                    TRAN
TDP-C-MS-2-T-10-FT                    TRAN
TDP-C-MS-2-T-14-FT                    TRAN
TDP-C-MS-2-T-18-FT                    TRAN
TDP-C-MS-2-T-22-FT                    TRAN
TDP-C-MS-2-T-26-FT                    TRAN
TDP-C-MS-2-AF-FT                  AND     HE-MS-2  TDP-C-MS-2-AF-GT1
TDP-C-MS-2-AF-GT1                    OR     TDP-C-MS-2-T-6-GT  TDP-C-MS-2-T-10-GT  TDP-C-MS-2-T-14-GT  TDP-C-MS-2-T-18-GT  TDP-C-MS-2-T-22-GT  TDP-C-MS-2-T-26-GT  
TDP-C-MS-2-T-6-GT                 AND   HE-T-6  TDP-C-MS-2-T-6-FT 
TDP-C-MS-2-T-10-GT                 AND   HE-T-10  TDP-C-MS-2-T-10-FT NOT-TDP-C-MS-2-T-6-AF-GT  
TDP-C-MS-2-T-14-GT                 AND   HE-T-14  TDP-C-MS-2-T-14-FT NOT-TDP-C-MS-2-T-6-AF-GT  NOT-TDP-C-MS-2-T-10-AF-GT  
TDP-C-MS-2-T-18-GT                 AND   HE-T-18  TDP-C-MS-2-T-18-FT NOT-TDP-C-MS-2-T-6-AF-GT  NOT-TDP-C-MS-2-T-10-AF-GT  NOT-TDP-C-MS-2-T-14-AF-GT  
TDP-C-MS-2-T-22-GT                 AND   HE-T-22  TDP-C-MS-2-T-22-FT NOT-TDP-C-MS-2-T-6-AF-GT  NOT-TDP-C-MS-2-T-10-AF-GT  NOT-TDP-C-MS-2-T-14-AF-GT  NOT-TDP-C-MS-2-T-18-AF-GT  
TDP-C-MS-2-T-26-GT                 AND   HE-T-26  TDP-C-MS-2-T-26-FT NOT-TDP-C-MS-2-T-6-AF-GT  NOT-TDP-C-MS-2-T-10-AF-GT  NOT-TDP-C-MS-2-T-14-AF-GT  NOT-TDP-C-MS-2-T-18-AF-GT  NOT-TDP-C-MS-2-T-22-AF-GT  
NOT-TDP-C-MS-2-T-6-AF-GT             NOR   TDP-C-MS-2-T-6-FT
NOT-TDP-C-MS-2-T-10-AF-GT             NOR   TDP-C-MS-2-T-10-FT
NOT-TDP-C-MS-2-T-14-AF-GT             NOR   TDP-C-MS-2-T-14-FT
NOT-TDP-C-MS-2-T-18-AF-GT             NOR   TDP-C-MS-2-T-18-FT
NOT-TDP-C-MS-2-T-22-AF-GT             NOR   TDP-C-MS-2-T-22-FT
NOT-TDP-C-MS-2-T-26-AF-GT             NOR   TDP-C-MS-2-T-26-FT
^EOS
G-PWR,   TDP-C-MS-2-T-6-FT = 
TDP-C-MS-2-T-6-FT =                   OR    TDP-C-AS-1-MS-2-T-6-CE  TDP-C-AS-2-MS-2-T-6-CE  TDP-C-AS-3-MS-2-T-6-CE  
^EOS
G-PWR,   TDP-C-MS-2-T-10-FT = 
TDP-C-MS-2-T-10-FT =                   OR    TDP-C-AS-1-MS-2-T-10-CE  TDP-C-AS-2-MS-2-T-10-CE  TDP-C-AS-3-MS-2-T-10-CE  
^EOS
G-PWR,   TDP-C-MS-2-T-14-FT = 
TDP-C-MS-2-T-14-FT =                   OR    TDP-C-AS-1-MS-2-T-14-CE  TDP-C-AS-2-MS-2-T-14-CE  TDP-C-AS-3-MS-2-T-14-CE  
^EOS
G-PWR,   TDP-C-MS-2-T-18-FT = 
TDP-C-MS-2-T-18-FT =                   OR    TDP-C-AS-1-MS-2-T-18-CE  TDP-C-AS-2-MS-2-T-18-CE  TDP-C-AS-3-MS-2-T-18-CE  
^EOS
G-PWR,   TDP-C-MS-2-T-22-FT = 
TDP-C-MS-2-T-22-FT =                   OR    TDP-C-AS-1-MS-2-T-22-CE  TDP-C-AS-2-MS-2-T-22-CE  TDP-C-AS-3-MS-2-T-22-CE  
^EOS
G-PWR,   TDP-C-MS-2-T-26-FT = 
TDP-C-MS-2-T-26-FT =                   OR    TDP-C-AS-1-MS-2-T-26-CE  TDP-C-AS-2-MS-2-T-26-CE  TDP-C-AS-3-MS-2-T-26-CE  
^EOS
G-PWR,  TDP-C-MS-3-AF-FT  = 
TDP-C-MS-3-T-6-FT                    TRAN
TDP-C-MS-3-T-10-FT                    TRAN
TDP-C-MS-3-T-14-FT                    TRAN
TDP-C-MS-3-T-18-FT                    TRAN
TDP-C-MS-3-T-22-FT                    TRAN
TDP-C-MS-3-T-26-FT                    TRAN
TDP-C-MS-3-AF-FT                  AND     HE-MS-3  TDP-C-MS-3-AF-GT1
TDP-C-MS-3-AF-GT1                    OR     TDP-C-MS-3-T-6-GT  TDP-C-MS-3-T-10-GT  TDP-C-MS-3-T-14-GT  TDP-C-MS-3-T-18-GT  TDP-C-MS-3-T-22-GT  TDP-C-MS-3-T-26-GT  
TDP-C-MS-3-T-6-GT                 AND   HE-T-6  TDP-C-MS-3-T-6-FT 
TDP-C-MS-3-T-10-GT                 AND   HE-T-10  TDP-C-MS-3-T-10-FT NOT-TDP-C-MS-3-T-6-AF-GT  
TDP-C-MS-3-T-14-GT                 AND   HE-T-14  TDP-C-MS-3-T-14-FT NOT-TDP-C-MS-3-T-6-AF-GT  NOT-TDP-C-MS-3-T-10-AF-GT  
TDP-C-MS-3-T-18-GT                 AND   HE-T-18  TDP-C-MS-3-T-18-FT NOT-TDP-C-MS-3-T-6-AF-GT  NOT-TDP-C-MS-3-T-10-AF-GT  NOT-TDP-C-MS-3-T-14-AF-GT  
TDP-C-MS-3-T-22-GT                 AND   HE-T-22  TDP-C-MS-3-T-22-FT NOT-TDP-C-MS-3-T-6-AF-GT  NOT-TDP-C-MS-3-T-10-AF-GT  NOT-TDP-C-MS-3-T-14-AF-GT  NOT-TDP-C-MS-3-T-18-AF-GT  
TDP-C-MS-3-T-26-GT                 AND   HE-T-26  TDP-C-MS-3-T-26-FT NOT-TDP-C-MS-3-T-6-AF-GT  NOT-TDP-C-MS-3-T-10-AF-GT  NOT-TDP-C-MS-3-T-14-AF-GT  NOT-TDP-C-MS-3-T-18-AF-GT  NOT-TDP-C-MS-3-T-22-AF-GT  
NOT-TDP-C-MS-3-T-6-AF-GT             NOR   TDP-C-MS-3-T-6-FT
NOT-TDP-C-MS-3-T-10-AF-GT             NOR   TDP-C-MS-3-T-10-FT
NOT-TDP-C-MS-3-T-14-AF-GT             NOR   TDP-C-MS-3-T-14-FT
NOT-TDP-C-MS-3-T-18-AF-GT             NOR   TDP-C-MS-3-T-18-FT
NOT-TDP-C-MS-3-T-22-AF-GT             NOR   TDP-C-MS-3-T-22-FT
NOT-TDP-C-MS-3-T-26-AF-GT             NOR   TDP-C-MS-3-T-26-FT
^EOS
G-PWR,   TDP-C-MS-3-T-6-FT = 
TDP-C-MS-3-T-6-FT =                   OR    TDP-C-AS-1-MS-3-T-6-CE  TDP-C-AS-2-MS-3-T-6-CE  TDP-C-AS-3-MS-3-T-6-CE  
^EOS
G-PWR,   TDP-C-MS-3-T-10-FT = 
TDP-C-MS-3-T-10-FT =                   OR    TDP-C-AS-1-MS-3-T-10-CE  TDP-C-AS-2-MS-3-T-10-CE  TDP-C-AS-3-MS-3-T-10-CE  
^EOS
G-PWR,   TDP-C-MS-3-T-14-FT = 
TDP-C-MS-3-T-14-FT =                   OR    TDP-C-AS-1-MS-3-T-14-CE  TDP-C-AS-2-MS-3-T-14-CE  TDP-C-AS-3-MS-3-T-14-CE  
^EOS
G-PWR,   TDP-C-MS-3-T-18-FT = 
TDP-C-MS-3-T-18-FT =                   OR    TDP-C-AS-1-MS-3-T-18-CE  TDP-C-AS-2-MS-3-T-18-CE  TDP-C-AS-3-MS-3-T-18-CE  
^EOS
G-PWR,   TDP-C-MS-3-T-22-FT = 
TDP-C-MS-3-T-22-FT =                   OR    TDP-C-AS-1-MS-3-T-22-CE  TDP-C-AS-2-MS-3-T-22-CE  TDP-C-AS-3-MS-3-T-22-CE  
^EOS
G-PWR,   TDP-C-MS-3-T-26-FT = 
TDP-C-MS-3-T-26-FT =                   OR    TDP-C-AS-1-MS-3-T-26-CE  TDP-C-AS-2-MS-3-T-26-CE  TDP-C-AS-3-MS-3-T-26-CE  
^EOS
G-PWR,  TDP-C-MS-4-AF-FT  = 
TDP-C-MS-4-T-6-FT                    TRAN
TDP-C-MS-4-T-10-FT                    TRAN
TDP-C-MS-4-T-14-FT                    TRAN
TDP-C-MS-4-T-18-FT                    TRAN
TDP-C-MS-4-T-22-FT                    TRAN
TDP-C-MS-4-T-26-FT                    TRAN
TDP-C-MS-4-AF-FT                  AND     HE-MS-4  TDP-C-MS-4-AF-GT1
TDP-C-MS-4-AF-GT1                    OR     TDP-C-MS-4-T-6-GT  TDP-C-MS-4-T-10-GT  TDP-C-MS-4-T-14-GT  TDP-C-MS-4-T-18-GT  TDP-C-MS-4-T-22-GT  TDP-C-MS-4-T-26-GT  
TDP-C-MS-4-T-6-GT                 AND   HE-T-6  TDP-C-MS-4-T-6-FT 
TDP-C-MS-4-T-10-GT                 AND   HE-T-10  TDP-C-MS-4-T-10-FT NOT-TDP-C-MS-4-T-6-AF-GT  
TDP-C-MS-4-T-14-GT                 AND   HE-T-14  TDP-C-MS-4-T-14-FT NOT-TDP-C-MS-4-T-6-AF-GT  NOT-TDP-C-MS-4-T-10-AF-GT  
TDP-C-MS-4-T-18-GT                 AND   HE-T-18  TDP-C-MS-4-T-18-FT NOT-TDP-C-MS-4-T-6-AF-GT  NOT-TDP-C-MS-4-T-10-AF-GT  NOT-TDP-C-MS-4-T-14-AF-GT  
TDP-C-MS-4-T-22-GT                 AND   HE-T-22  TDP-C-MS-4-T-22-FT NOT-TDP-C-MS-4-T-6-AF-GT  NOT-TDP-C-MS-4-T-10-AF-GT  NOT-TDP-C-MS-4-T-14-AF-GT  NOT-TDP-C-MS-4-T-18-AF-GT  
TDP-C-MS-4-T-26-GT                 AND   HE-T-26  TDP-C-MS-4-T-26-FT NOT-TDP-C-MS-4-T-6-AF-GT  NOT-TDP-C-MS-4-T-10-AF-GT  NOT-TDP-C-MS-4-T-14-AF-GT  NOT-TDP-C-MS-4-T-18-AF-GT  NOT-TDP-C-MS-4-T-22-AF-GT  
NOT-TDP-C-MS-4-T-6-AF-GT             NOR   TDP-C-MS-4-T-6-FT
NOT-TDP-C-MS-4-T-10-AF-GT             NOR   TDP-C-MS-4-T-10-FT
NOT-TDP-C-MS-4-T-14-AF-GT             NOR   TDP-C-MS-4-T-14-FT
NOT-TDP-C-MS-4-T-18-AF-GT             NOR   TDP-C-MS-4-T-18-FT
NOT-TDP-C-MS-4-T-22-AF-GT             NOR   TDP-C-MS-4-T-22-FT
NOT-TDP-C-MS-4-T-26-AF-GT             NOR   TDP-C-MS-4-T-26-FT
^EOS
G-PWR,   TDP-C-MS-4-T-6-FT = 
TDP-C-MS-4-T-6-FT =                   OR    TDP-C-AS-1-MS-4-T-6-CE  TDP-C-AS-2-MS-4-T-6-CE  TDP-C-AS-3-MS-4-T-6-CE  
^EOS
G-PWR,   TDP-C-MS-4-T-10-FT = 
TDP-C-MS-4-T-10-FT =                   OR    TDP-C-AS-1-MS-4-T-10-CE  TDP-C-AS-2-MS-4-T-10-CE  TDP-C-AS-3-MS-4-T-10-CE  
^EOS
G-PWR,   TDP-C-MS-4-T-14-FT = 
TDP-C-MS-4-T-14-FT =                   OR    TDP-C-AS-1-MS-4-T-14-CE  TDP-C-AS-2-MS-4-T-14-CE  TDP-C-AS-3-MS-4-T-14-CE  
^EOS
G-PWR,   TDP-C-MS-4-T-18-FT = 
TDP-C-MS-4-T-18-FT =                   OR    TDP-C-AS-1-MS-4-T-18-CE  TDP-C-AS-2-MS-4-T-18-CE  TDP-C-AS-3-MS-4-T-18-CE  
^EOS
G-PWR,   TDP-C-MS-4-T-22-FT = 
TDP-C-MS-4-T-22-FT =                   OR    TDP-C-AS-1-MS-4-T-22-CE  TDP-C-AS-2-MS-4-T-22-CE  TDP-C-AS-3-MS-4-T-22-CE  
^EOS
G-PWR,   TDP-C-MS-4-T-26-FT = 
TDP-C-MS-4-T-26-FT =                   OR    TDP-C-AS-1-MS-4-T-26-CE  TDP-C-AS-2-MS-4-T-26-CE  TDP-C-AS-3-MS-4-T-26-CE  
^EOS
G-PWR,  TDP-C-MS-5-AF-FT  = 
TDP-C-MS-5-T-6-FT                    TRAN
TDP-C-MS-5-T-10-FT                    TRAN
TDP-C-MS-5-T-14-FT                    TRAN
TDP-C-MS-5-T-18-FT                    TRAN
TDP-C-MS-5-T-22-FT                    TRAN
TDP-C-MS-5-T-26-FT                    TRAN
TDP-C-MS-5-AF-FT                  AND     HE-MS-5  TDP-C-MS-5-AF-GT1
TDP-C-MS-5-AF-GT1                    OR     TDP-C-MS-5-T-6-GT  TDP-C-MS-5-T-10-GT  TDP-C-MS-5-T-14-GT  TDP-C-MS-5-T-18-GT  TDP-C-MS-5-T-22-GT  TDP-C-MS-5-T-26-GT  
TDP-C-MS-5-T-6-GT                 AND   HE-T-6  TDP-C-MS-5-T-6-FT 
TDP-C-MS-5-T-10-GT                 AND   HE-T-10  TDP-C-MS-5-T-10-FT NOT-TDP-C-MS-5-T-6-AF-GT  
TDP-C-MS-5-T-14-GT                 AND   HE-T-14  TDP-C-MS-5-T-14-FT NOT-TDP-C-MS-5-T-6-AF-GT  NOT-TDP-C-MS-5-T-10-AF-GT  
TDP-C-MS-5-T-18-GT                 AND   HE-T-18  TDP-C-MS-5-T-18-FT NOT-TDP-C-MS-5-T-6-AF-GT  NOT-TDP-C-MS-5-T-10-AF-GT  NOT-TDP-C-MS-5-T-14-AF-GT  
TDP-C-MS-5-T-22-GT                 AND   HE-T-22  TDP-C-MS-5-T-22-FT NOT-TDP-C-MS-5-T-6-AF-GT  NOT-TDP-C-MS-5-T-10-AF-GT  NOT-TDP-C-MS-5-T-14-AF-GT  NOT-TDP-C-MS-5-T-18-AF-GT  
TDP-C-MS-5-T-26-GT                 AND   HE-T-26  TDP-C-MS-5-T-26-FT NOT-TDP-C-MS-5-T-6-AF-GT  NOT-TDP-C-MS-5-T-10-AF-GT  NOT-TDP-C-MS-5-T-14-AF-GT  NOT-TDP-C-MS-5-T-18-AF-GT  NOT-TDP-C-MS-5-T-22-AF-GT  
NOT-TDP-C-MS-5-T-6-AF-GT             NOR   TDP-C-MS-5-T-6-FT
NOT-TDP-C-MS-5-T-10-AF-GT             NOR   TDP-C-MS-5-T-10-FT
NOT-TDP-C-MS-5-T-14-AF-GT             NOR   TDP-C-MS-5-T-14-FT
NOT-TDP-C-MS-5-T-18-AF-GT             NOR   TDP-C-MS-5-T-18-FT
NOT-TDP-C-MS-5-T-22-AF-GT             NOR   TDP-C-MS-5-T-22-FT
NOT-TDP-C-MS-5-T-26-AF-GT             NOR   TDP-C-MS-5-T-26-FT
^EOS
G-PWR,   TDP-C-MS-5-T-6-FT = 
TDP-C-MS-5-T-6-FT =                   OR    TDP-C-AS-1-MS-5-T-6-CE  TDP-C-AS-2-MS-5-T-6-CE  TDP-C-AS-3-MS-5-T-6-CE  
^EOS
G-PWR,   TDP-C-MS-5-T-10-FT = 
TDP-C-MS-5-T-10-FT =                   OR    TDP-C-AS-1-MS-5-T-10-CE  TDP-C-AS-2-MS-5-T-10-CE  TDP-C-AS-3-MS-5-T-10-CE  
^EOS
G-PWR,   TDP-C-MS-5-T-14-FT = 
TDP-C-MS-5-T-14-FT =                   OR    TDP-C-AS-1-MS-5-T-14-CE  TDP-C-AS-2-MS-5-T-14-CE  TDP-C-AS-3-MS-5-T-14-CE  
^EOS
G-PWR,   TDP-C-MS-5-T-18-FT = 
TDP-C-MS-5-T-18-FT =                   OR    TDP-C-AS-1-MS-5-T-18-CE  TDP-C-AS-2-MS-5-T-18-CE  TDP-C-AS-3-MS-5-T-18-CE  
^EOS
G-PWR,   TDP-C-MS-5-T-22-FT = 
TDP-C-MS-5-T-22-FT =                   OR    TDP-C-AS-1-MS-5-T-22-CE  TDP-C-AS-2-MS-5-T-22-CE  TDP-C-AS-3-MS-5-T-22-CE  
^EOS
G-PWR,   TDP-C-MS-5-T-26-FT = 
TDP-C-MS-5-T-26-FT =                   OR    TDP-C-AS-1-MS-5-T-26-CE  TDP-C-AS-2-MS-5-T-26-CE  TDP-C-AS-3-MS-5-T-26-CE  
^EOS
G-PWR,  TDP-C-MS-6-AF-FT  = 
TDP-C-MS-6-T-6-FT                    TRAN
TDP-C-MS-6-T-10-FT                    TRAN
TDP-C-MS-6-T-14-FT                    TRAN
TDP-C-MS-6-T-18-FT                    TRAN
TDP-C-MS-6-T-22-FT                    TRAN
TDP-C-MS-6-T-26-FT                    TRAN
TDP-C-MS-6-AF-FT                  AND     HE-MS-6  TDP-C-MS-6-AF-GT1
TDP-C-MS-6-AF-GT1                    OR     TDP-C-MS-6-T-6-GT  TDP-C-MS-6-T-10-GT  TDP-C-MS-6-T-14-GT  TDP-C-MS-6-T-18-GT  TDP-C-MS-6-T-22-GT  TDP-C-MS-6-T-26-GT  
TDP-C-MS-6-T-6-GT                 AND   HE-T-6  TDP-C-MS-6-T-6-FT 
TDP-C-MS-6-T-10-GT                 AND   HE-T-10  TDP-C-MS-6-T-10-FT NOT-TDP-C-MS-6-T-6-AF-GT  
TDP-C-MS-6-T-14-GT                 AND   HE-T-14  TDP-C-MS-6-T-14-FT NOT-TDP-C-MS-6-T-6-AF-GT  NOT-TDP-C-MS-6-T-10-AF-GT  
TDP-C-MS-6-T-18-GT                 AND   HE-T-18  TDP-C-MS-6-T-18-FT NOT-TDP-C-MS-6-T-6-AF-GT  NOT-TDP-C-MS-6-T-10-AF-GT  NOT-TDP-C-MS-6-T-14-AF-GT  
TDP-C-MS-6-T-22-GT                 AND   HE-T-22  TDP-C-MS-6-T-22-FT NOT-TDP-C-MS-6-T-6-AF-GT  NOT-TDP-C-MS-6-T-10-AF-GT  NOT-TDP-C-MS-6-T-14-AF-GT  NOT-TDP-C-MS-6-T-18-AF-GT  
TDP-C-MS-6-T-26-GT                 AND   HE-T-26  TDP-C-MS-6-T-26-FT NOT-TDP-C-MS-6-T-6-AF-GT  NOT-TDP-C-MS-6-T-10-AF-GT  NOT-TDP-C-MS-6-T-14-AF-GT  NOT-TDP-C-MS-6-T-18-AF-GT  NOT-TDP-C-MS-6-T-22-AF-GT  
NOT-TDP-C-MS-6-T-6-AF-GT             NOR   TDP-C-MS-6-T-6-FT
NOT-TDP-C-MS-6-T-10-AF-GT             NOR   TDP-C-MS-6-T-10-FT
NOT-TDP-C-MS-6-T-14-AF-GT             NOR   TDP-C-MS-6-T-14-FT
NOT-TDP-C-MS-6-T-18-AF-GT             NOR   TDP-C-MS-6-T-18-FT
NOT-TDP-C-MS-6-T-22-AF-GT             NOR   TDP-C-MS-6-T-22-FT
NOT-TDP-C-MS-6-T-26-AF-GT             NOR   TDP-C-MS-6-T-26-FT
^EOS
G-PWR,   TDP-C-MS-6-T-6-FT = 
TDP-C-MS-6-T-6-FT =                   OR    TDP-C-AS-1-MS-6-T-6-CE  TDP-C-AS-2-MS-6-T-6-CE  TDP-C-AS-3-MS-6-T-6-CE  
^EOS
G-PWR,   TDP-C-MS-6-T-10-FT = 
TDP-C-MS-6-T-10-FT =                   OR    TDP-C-AS-1-MS-6-T-10-CE  TDP-C-AS-2-MS-6-T-10-CE  TDP-C-AS-3-MS-6-T-10-CE  
^EOS
G-PWR,   TDP-C-MS-6-T-14-FT = 
TDP-C-MS-6-T-14-FT =                   OR    TDP-C-AS-1-MS-6-T-14-CE  TDP-C-AS-2-MS-6-T-14-CE  TDP-C-AS-3-MS-6-T-14-CE  
^EOS
G-PWR,   TDP-C-MS-6-T-18-FT = 
TDP-C-MS-6-T-18-FT =                   OR    TDP-C-AS-1-MS-6-T-18-CE  TDP-C-AS-2-MS-6-T-18-CE  TDP-C-AS-3-MS-6-T-18-CE  
^EOS
G-PWR,   TDP-C-MS-6-T-22-FT = 
TDP-C-MS-6-T-22-FT =                   OR    TDP-C-AS-1-MS-6-T-22-CE  TDP-C-AS-2-MS-6-T-22-CE  TDP-C-AS-3-MS-6-T-22-CE  
^EOS
G-PWR,   TDP-C-MS-6-T-26-FT = 
TDP-C-MS-6-T-26-FT =                   OR    TDP-C-AS-1-MS-6-T-26-CE  TDP-C-AS-2-MS-6-T-26-CE  TDP-C-AS-3-MS-6-T-26-CE  
^EOS
G-PWR,  TDP-C-MS-7-AF-FT  = 
TDP-C-MS-7-T-6-FT                    TRAN
TDP-C-MS-7-T-10-FT                    TRAN
TDP-C-MS-7-T-14-FT                    TRAN
TDP-C-MS-7-T-18-FT                    TRAN
TDP-C-MS-7-T-22-FT                    TRAN
TDP-C-MS-7-T-26-FT                    TRAN
TDP-C-MS-7-AF-FT                  AND     HE-MS-7  TDP-C-MS-7-AF-GT1
TDP-C-MS-7-AF-GT1                    OR     TDP-C-MS-7-T-6-GT  TDP-C-MS-7-T-10-GT  TDP-C-MS-7-T-14-GT  TDP-C-MS-7-T-18-GT  TDP-C-MS-7-T-22-GT  TDP-C-MS-7-T-26-GT  
TDP-C-MS-7-T-6-GT                 AND   HE-T-6  TDP-C-MS-7-T-6-FT 
TDP-C-MS-7-T-10-GT                 AND   HE-T-10  TDP-C-MS-7-T-10-FT NOT-TDP-C-MS-7-T-6-AF-GT  
TDP-C-MS-7-T-14-GT                 AND   HE-T-14  TDP-C-MS-7-T-14-FT NOT-TDP-C-MS-7-T-6-AF-GT  NOT-TDP-C-MS-7-T-10-AF-GT  
TDP-C-MS-7-T-18-GT                 AND   HE-T-18  TDP-C-MS-7-T-18-FT NOT-TDP-C-MS-7-T-6-AF-GT  NOT-TDP-C-MS-7-T-10-AF-GT  NOT-TDP-C-MS-7-T-14-AF-GT  
TDP-C-MS-7-T-22-GT                 AND   HE-T-22  TDP-C-MS-7-T-22-FT NOT-TDP-C-MS-7-T-6-AF-GT  NOT-TDP-C-MS-7-T-10-AF-GT  NOT-TDP-C-MS-7-T-14-AF-GT  NOT-TDP-C-MS-7-T-18-AF-GT  
TDP-C-MS-7-T-26-GT                 AND   HE-T-26  TDP-C-MS-7-T-26-FT NOT-TDP-C-MS-7-T-6-AF-GT  NOT-TDP-C-MS-7-T-10-AF-GT  NOT-TDP-C-MS-7-T-14-AF-GT  NOT-TDP-C-MS-7-T-18-AF-GT  NOT-TDP-C-MS-7-T-22-AF-GT  
NOT-TDP-C-MS-7-T-6-AF-GT             NOR   TDP-C-MS-7-T-6-FT
NOT-TDP-C-MS-7-T-10-AF-GT             NOR   TDP-C-MS-7-T-10-FT
NOT-TDP-C-MS-7-T-14-AF-GT             NOR   TDP-C-MS-7-T-14-FT
NOT-TDP-C-MS-7-T-18-AF-GT             NOR   TDP-C-MS-7-T-18-FT
NOT-TDP-C-MS-7-T-22-AF-GT             NOR   TDP-C-MS-7-T-22-FT
NOT-TDP-C-MS-7-T-26-AF-GT             NOR   TDP-C-MS-7-T-26-FT
^EOS
G-PWR,   TDP-C-MS-7-T-6-FT = 
TDP-C-MS-7-T-6-FT =                   OR    TDP-C-AS-1-MS-7-T-6-CE  TDP-C-AS-2-MS-7-T-6-CE  TDP-C-AS-3-MS-7-T-6-CE  
^EOS
G-PWR,   TDP-C-MS-7-T-10-FT = 
TDP-C-MS-7-T-10-FT =                   OR    TDP-C-AS-1-MS-7-T-10-CE  TDP-C-AS-2-MS-7-T-10-CE  TDP-C-AS-3-MS-7-T-10-CE  
^EOS
G-PWR,   TDP-C-MS-7-T-14-FT = 
TDP-C-MS-7-T-14-FT =                   OR    TDP-C-AS-1-MS-7-T-14-CE  TDP-C-AS-2-MS-7-T-14-CE  TDP-C-AS-3-MS-7-T-14-CE  
^EOS
G-PWR,   TDP-C-MS-7-T-18-FT = 
TDP-C-MS-7-T-18-FT =                   OR    TDP-C-AS-1-MS-7-T-18-CE  TDP-C-AS-2-MS-7-T-18-CE  TDP-C-AS-3-MS-7-T-18-CE  
^EOS
G-PWR,   TDP-C-MS-7-T-22-FT = 
TDP-C-MS-7-T-22-FT =                   OR    TDP-C-AS-1-MS-7-T-22-CE  TDP-C-AS-2-MS-7-T-22-CE  TDP-C-AS-3-MS-7-T-22-CE  
^EOS
G-PWR,   TDP-C-MS-7-T-26-FT = 
TDP-C-MS-7-T-26-FT =                   OR    TDP-C-AS-1-MS-7-T-26-CE  TDP-C-AS-2-MS-7-T-26-CE  TDP-C-AS-3-MS-7-T-26-CE  
^EOS
G-PWR,   CDP-A-MS-FT = 
CDP-A-MS-FT            OR  CDP-A-MS-1-GT  CDP-A-MS-2-GT  CDP-A-MS-3-GT  CDP-A-MS-4-GT  CDP-A-MS-5-GT  CDP-A-MS-6-GT  CDP-A-MS-7-GT  
CDP-A-MS-1-GT            AND  HE-MS-1   CDP-A-MS-1  
CDP-A-MS-2-GT            AND  HE-MS-2   CDP-A-MS-2  
CDP-A-MS-3-GT            AND  HE-MS-3   CDP-A-MS-3  
CDP-A-MS-4-GT            AND  HE-MS-4   CDP-A-MS-4  
CDP-A-MS-5-GT            AND  HE-MS-5   CDP-A-MS-5  
CDP-A-MS-6-GT            AND  HE-MS-6   CDP-A-MS-6  
CDP-A-MS-7-GT            AND  HE-MS-7   CDP-A-MS-7  
^EOS
G-PWR,   CDP-B-MS-FT = 
CDP-B-MS-FT            OR  CDP-B-MS-1-GT  CDP-B-MS-2-GT  CDP-B-MS-3-GT  CDP-B-MS-4-GT  CDP-B-MS-5-GT  CDP-B-MS-6-GT  CDP-B-MS-7-GT  
CDP-B-MS-1-GT            AND  HE-MS-1   CDP-B-MS-1  
CDP-B-MS-2-GT            AND  HE-MS-2   CDP-B-MS-2  
CDP-B-MS-3-GT            AND  HE-MS-3   CDP-B-MS-3  
CDP-B-MS-4-GT            AND  HE-MS-4   CDP-B-MS-4  
CDP-B-MS-5-GT            AND  HE-MS-5   CDP-B-MS-5  
CDP-B-MS-6-GT            AND  HE-MS-6   CDP-B-MS-6  
CDP-B-MS-7-GT            AND  HE-MS-7   CDP-B-MS-7  
^EOS
G-PWR,   CDP-C-MS-FT = 
CDP-C-MS-FT            OR  CDP-C-MS-1-GT  CDP-C-MS-2-GT  CDP-C-MS-3-GT  CDP-C-MS-4-GT  CDP-C-MS-5-GT  CDP-C-MS-6-GT  CDP-C-MS-7-GT  
CDP-C-MS-1-GT            AND  HE-MS-1   CDP-C-MS-1  
CDP-C-MS-2-GT            AND  HE-MS-2   CDP-C-MS-2  
CDP-C-MS-3-GT            AND  HE-MS-3   CDP-C-MS-3  
CDP-C-MS-4-GT            AND  HE-MS-4   CDP-C-MS-4  
CDP-C-MS-5-GT            AND  HE-MS-5   CDP-C-MS-5  
CDP-C-MS-6-GT            AND  HE-MS-6   CDP-C-MS-6  
CDP-C-MS-7-GT            AND  HE-MS-7   CDP-C-MS-7  
^EOS
G-PWR,  CDP-A-SEIS-FT =
CDP-A-MS-1-AF-FT                 TRAN
CDP-A-MS-2-AF-FT                 TRAN
CDP-A-MS-3-AF-FT                 TRAN
CDP-A-MS-4-AF-FT                 TRAN
CDP-A-MS-5-AF-FT                 TRAN
CDP-A-MS-6-AF-FT                 TRAN
CDP-A-MS-7-AF-FT                 TRAN
CDP-A-SEIS-FT                      OR  CDP-A-MS-FT  CDP-A-AS-GT
CDP-A-AS-GT                            AND CDP-A-AS-F-GT  NOT-CDP-A-MS-FT 
CDP-A-AS-F-GT                          OR  CDP-A-MS-1-AF-FT  CDP-A-MS-2-AF-FT  CDP-A-MS-3-AF-FT  CDP-A-MS-4-AF-FT  CDP-A-MS-5-AF-FT  CDP-A-MS-6-AF-FT  CDP-A-MS-7-AF-FT  
CDP-A-MS-FT                              TRAN
NOT-CDP-A-MS-FT            NOR CDP-A-MS-FT 
^EOS
G-PWR,  CDP-A-MS-1-AF-FT  = 
CDP-A-MS-1-T-8-FT                    TRAN
CDP-A-MS-1-T-12-FT                    TRAN
CDP-A-MS-1-T-16-FT                    TRAN
CDP-A-MS-1-T-20-FT                    TRAN
CDP-A-MS-1-AF-FT                  AND     HE-MS-1  CDP-A-MS-1-AF-GT1
CDP-A-MS-1-AF-GT1                    OR     CDP-A-MS-1-T-8-GT  CDP-A-MS-1-T-12-GT  CDP-A-MS-1-T-16-GT  CDP-A-MS-1-T-20-GT  
CDP-A-MS-1-T-8-GT                 AND   HE-T-8  CDP-A-MS-1-T-8-FT 
CDP-A-MS-1-T-12-GT                 AND   HE-T-12  CDP-A-MS-1-T-12-FT NOT-CDP-A-MS-1-T-8-AF-GT  
CDP-A-MS-1-T-16-GT                 AND   HE-T-16  CDP-A-MS-1-T-16-FT NOT-CDP-A-MS-1-T-8-AF-GT  NOT-CDP-A-MS-1-T-12-AF-GT  
CDP-A-MS-1-T-20-GT                 AND   HE-T-20  CDP-A-MS-1-T-20-FT NOT-CDP-A-MS-1-T-8-AF-GT  NOT-CDP-A-MS-1-T-12-AF-GT  NOT-CDP-A-MS-1-T-16-AF-GT  
NOT-CDP-A-MS-1-T-8-AF-GT             NOR   CDP-A-MS-1-T-8-FT
NOT-CDP-A-MS-1-T-12-AF-GT             NOR   CDP-A-MS-1-T-12-FT
NOT-CDP-A-MS-1-T-16-AF-GT             NOR   CDP-A-MS-1-T-16-FT
NOT-CDP-A-MS-1-T-20-AF-GT             NOR   CDP-A-MS-1-T-20-FT
^EOS
G-PWR,   CDP-A-MS-1-T-8-FT = 
CDP-A-MS-1-T-8-FT =                   OR    CDP-A-AS-1-MS-1-T-8-CE  CDP-A-AS-2-MS-1-T-8-CE  CDP-A-AS-3-MS-1-T-8-CE  
^EOS
G-PWR,   CDP-A-MS-1-T-12-FT = 
CDP-A-MS-1-T-12-FT =                   OR    CDP-A-AS-1-MS-1-T-12-CE  CDP-A-AS-2-MS-1-T-12-CE  CDP-A-AS-3-MS-1-T-12-CE  
^EOS
G-PWR,   CDP-A-MS-1-T-16-FT = 
CDP-A-MS-1-T-16-FT =                   OR    CDP-A-AS-1-MS-1-T-16-CE  CDP-A-AS-2-MS-1-T-16-CE  CDP-A-AS-3-MS-1-T-16-CE  
^EOS
G-PWR,   CDP-A-MS-1-T-20-FT = 
CDP-A-MS-1-T-20-FT =                   OR    CDP-A-AS-1-MS-1-T-20-CE  CDP-A-AS-2-MS-1-T-20-CE  CDP-A-AS-3-MS-1-T-20-CE  
^EOS
G-PWR,  CDP-A-MS-2-AF-FT  = 
CDP-A-MS-2-T-8-FT                    TRAN
CDP-A-MS-2-T-12-FT                    TRAN
CDP-A-MS-2-T-16-FT                    TRAN
CDP-A-MS-2-T-20-FT                    TRAN
CDP-A-MS-2-AF-FT                  AND     HE-MS-2  CDP-A-MS-2-AF-GT1
CDP-A-MS-2-AF-GT1                    OR     CDP-A-MS-2-T-8-GT  CDP-A-MS-2-T-12-GT  CDP-A-MS-2-T-16-GT  CDP-A-MS-2-T-20-GT  
CDP-A-MS-2-T-8-GT                 AND   HE-T-8  CDP-A-MS-2-T-8-FT 
CDP-A-MS-2-T-12-GT                 AND   HE-T-12  CDP-A-MS-2-T-12-FT NOT-CDP-A-MS-2-T-8-AF-GT  
CDP-A-MS-2-T-16-GT                 AND   HE-T-16  CDP-A-MS-2-T-16-FT NOT-CDP-A-MS-2-T-8-AF-GT  NOT-CDP-A-MS-2-T-12-AF-GT  
CDP-A-MS-2-T-20-GT                 AND   HE-T-20  CDP-A-MS-2-T-20-FT NOT-CDP-A-MS-2-T-8-AF-GT  NOT-CDP-A-MS-2-T-12-AF-GT  NOT-CDP-A-MS-2-T-16-AF-GT  
NOT-CDP-A-MS-2-T-8-AF-GT             NOR   CDP-A-MS-2-T-8-FT
NOT-CDP-A-MS-2-T-12-AF-GT             NOR   CDP-A-MS-2-T-12-FT
NOT-CDP-A-MS-2-T-16-AF-GT             NOR   CDP-A-MS-2-T-16-FT
NOT-CDP-A-MS-2-T-20-AF-GT             NOR   CDP-A-MS-2-T-20-FT
^EOS
G-PWR,   CDP-A-MS-2-T-8-FT = 
CDP-A-MS-2-T-8-FT =                   OR    CDP-A-AS-1-MS-2-T-8-CE  CDP-A-AS-2-MS-2-T-8-CE  CDP-A-AS-3-MS-2-T-8-CE  
^EOS
G-PWR,   CDP-A-MS-2-T-12-FT = 
CDP-A-MS-2-T-12-FT =                   OR    CDP-A-AS-1-MS-2-T-12-CE  CDP-A-AS-2-MS-2-T-12-CE  CDP-A-AS-3-MS-2-T-12-CE  
^EOS
G-PWR,   CDP-A-MS-2-T-16-FT = 
CDP-A-MS-2-T-16-FT =                   OR    CDP-A-AS-1-MS-2-T-16-CE  CDP-A-AS-2-MS-2-T-16-CE  CDP-A-AS-3-MS-2-T-16-CE  
^EOS
G-PWR,   CDP-A-MS-2-T-20-FT = 
CDP-A-MS-2-T-20-FT =                   OR    CDP-A-AS-1-MS-2-T-20-CE  CDP-A-AS-2-MS-2-T-20-CE  CDP-A-AS-3-MS-2-T-20-CE  
^EOS
G-PWR,  CDP-A-MS-3-AF-FT  = 
CDP-A-MS-3-T-8-FT                    TRAN
CDP-A-MS-3-T-12-FT                    TRAN
CDP-A-MS-3-T-16-FT                    TRAN
CDP-A-MS-3-T-20-FT                    TRAN
CDP-A-MS-3-AF-FT                  AND     HE-MS-3  CDP-A-MS-3-AF-GT1
CDP-A-MS-3-AF-GT1                    OR     CDP-A-MS-3-T-8-GT  CDP-A-MS-3-T-12-GT  CDP-A-MS-3-T-16-GT  CDP-A-MS-3-T-20-GT  
CDP-A-MS-3-T-8-GT                 AND   HE-T-8  CDP-A-MS-3-T-8-FT 
CDP-A-MS-3-T-12-GT                 AND   HE-T-12  CDP-A-MS-3-T-12-FT NOT-CDP-A-MS-3-T-8-AF-GT  
CDP-A-MS-3-T-16-GT                 AND   HE-T-16  CDP-A-MS-3-T-16-FT NOT-CDP-A-MS-3-T-8-AF-GT  NOT-CDP-A-MS-3-T-12-AF-GT  
CDP-A-MS-3-T-20-GT                 AND   HE-T-20  CDP-A-MS-3-T-20-FT NOT-CDP-A-MS-3-T-8-AF-GT  NOT-CDP-A-MS-3-T-12-AF-GT  NOT-CDP-A-MS-3-T-16-AF-GT  
NOT-CDP-A-MS-3-T-8-AF-GT             NOR   CDP-A-MS-3-T-8-FT
NOT-CDP-A-MS-3-T-12-AF-GT             NOR   CDP-A-MS-3-T-12-FT
NOT-CDP-A-MS-3-T-16-AF-GT             NOR   CDP-A-MS-3-T-16-FT
NOT-CDP-A-MS-3-T-20-AF-GT             NOR   CDP-A-MS-3-T-20-FT
^EOS
G-PWR,   CDP-A-MS-3-T-8-FT = 
CDP-A-MS-3-T-8-FT =                   OR    CDP-A-AS-1-MS-3-T-8-CE  CDP-A-AS-2-MS-3-T-8-CE  CDP-A-AS-3-MS-3-T-8-CE  
^EOS
G-PWR,   CDP-A-MS-3-T-12-FT = 
CDP-A-MS-3-T-12-FT =                   OR    CDP-A-AS-1-MS-3-T-12-CE  CDP-A-AS-2-MS-3-T-12-CE  CDP-A-AS-3-MS-3-T-12-CE  
^EOS
G-PWR,   CDP-A-MS-3-T-16-FT = 
CDP-A-MS-3-T-16-FT =                   OR    CDP-A-AS-1-MS-3-T-16-CE  CDP-A-AS-2-MS-3-T-16-CE  CDP-A-AS-3-MS-3-T-16-CE  
^EOS
G-PWR,   CDP-A-MS-3-T-20-FT = 
CDP-A-MS-3-T-20-FT =                   OR    CDP-A-AS-1-MS-3-T-20-CE  CDP-A-AS-2-MS-3-T-20-CE  CDP-A-AS-3-MS-3-T-20-CE  
^EOS
G-PWR,  CDP-A-MS-4-AF-FT  = 
CDP-A-MS-4-T-8-FT                    TRAN
CDP-A-MS-4-T-12-FT                    TRAN
CDP-A-MS-4-T-16-FT                    TRAN
CDP-A-MS-4-T-20-FT                    TRAN
CDP-A-MS-4-AF-FT                  AND     HE-MS-4  CDP-A-MS-4-AF-GT1
CDP-A-MS-4-AF-GT1                    OR     CDP-A-MS-4-T-8-GT  CDP-A-MS-4-T-12-GT  CDP-A-MS-4-T-16-GT  CDP-A-MS-4-T-20-GT  
CDP-A-MS-4-T-8-GT                 AND   HE-T-8  CDP-A-MS-4-T-8-FT 
CDP-A-MS-4-T-12-GT                 AND   HE-T-12  CDP-A-MS-4-T-12-FT NOT-CDP-A-MS-4-T-8-AF-GT  
CDP-A-MS-4-T-16-GT                 AND   HE-T-16  CDP-A-MS-4-T-16-FT NOT-CDP-A-MS-4-T-8-AF-GT  NOT-CDP-A-MS-4-T-12-AF-GT  
CDP-A-MS-4-T-20-GT                 AND   HE-T-20  CDP-A-MS-4-T-20-FT NOT-CDP-A-MS-4-T-8-AF-GT  NOT-CDP-A-MS-4-T-12-AF-GT  NOT-CDP-A-MS-4-T-16-AF-GT  
NOT-CDP-A-MS-4-T-8-AF-GT             NOR   CDP-A-MS-4-T-8-FT
NOT-CDP-A-MS-4-T-12-AF-GT             NOR   CDP-A-MS-4-T-12-FT
NOT-CDP-A-MS-4-T-16-AF-GT             NOR   CDP-A-MS-4-T-16-FT
NOT-CDP-A-MS-4-T-20-AF-GT             NOR   CDP-A-MS-4-T-20-FT
^EOS
G-PWR,   CDP-A-MS-4-T-8-FT = 
CDP-A-MS-4-T-8-FT =                   OR    CDP-A-AS-1-MS-4-T-8-CE  CDP-A-AS-2-MS-4-T-8-CE  CDP-A-AS-3-MS-4-T-8-CE  
^EOS
G-PWR,   CDP-A-MS-4-T-12-FT = 
CDP-A-MS-4-T-12-FT =                   OR    CDP-A-AS-1-MS-4-T-12-CE  CDP-A-AS-2-MS-4-T-12-CE  CDP-A-AS-3-MS-4-T-12-CE  
^EOS
G-PWR,   CDP-A-MS-4-T-16-FT = 
CDP-A-MS-4-T-16-FT =                   OR    CDP-A-AS-1-MS-4-T-16-CE  CDP-A-AS-2-MS-4-T-16-CE  CDP-A-AS-3-MS-4-T-16-CE  
^EOS
G-PWR,   CDP-A-MS-4-T-20-FT = 
CDP-A-MS-4-T-20-FT =                   OR    CDP-A-AS-1-MS-4-T-20-CE  CDP-A-AS-2-MS-4-T-20-CE  CDP-A-AS-3-MS-4-T-20-CE  
^EOS
G-PWR,  CDP-A-MS-5-AF-FT  = 
CDP-A-MS-5-T-8-FT                    TRAN
CDP-A-MS-5-T-12-FT                    TRAN
CDP-A-MS-5-T-16-FT                    TRAN
CDP-A-MS-5-T-20-FT                    TRAN
CDP-A-MS-5-AF-FT                  AND     HE-MS-5  CDP-A-MS-5-AF-GT1
CDP-A-MS-5-AF-GT1                    OR     CDP-A-MS-5-T-8-GT  CDP-A-MS-5-T-12-GT  CDP-A-MS-5-T-16-GT  CDP-A-MS-5-T-20-GT  
CDP-A-MS-5-T-8-GT                 AND   HE-T-8  CDP-A-MS-5-T-8-FT 
CDP-A-MS-5-T-12-GT                 AND   HE-T-12  CDP-A-MS-5-T-12-FT NOT-CDP-A-MS-5-T-8-AF-GT  
CDP-A-MS-5-T-16-GT                 AND   HE-T-16  CDP-A-MS-5-T-16-FT NOT-CDP-A-MS-5-T-8-AF-GT  NOT-CDP-A-MS-5-T-12-AF-GT  
CDP-A-MS-5-T-20-GT                 AND   HE-T-20  CDP-A-MS-5-T-20-FT NOT-CDP-A-MS-5-T-8-AF-GT  NOT-CDP-A-MS-5-T-12-AF-GT  NOT-CDP-A-MS-5-T-16-AF-GT  
NOT-CDP-A-MS-5-T-8-AF-GT             NOR   CDP-A-MS-5-T-8-FT
NOT-CDP-A-MS-5-T-12-AF-GT             NOR   CDP-A-MS-5-T-12-FT
NOT-CDP-A-MS-5-T-16-AF-GT             NOR   CDP-A-MS-5-T-16-FT
NOT-CDP-A-MS-5-T-20-AF-GT             NOR   CDP-A-MS-5-T-20-FT
^EOS
G-PWR,   CDP-A-MS-5-T-8-FT = 
CDP-A-MS-5-T-8-FT =                   OR    CDP-A-AS-1-MS-5-T-8-CE  CDP-A-AS-2-MS-5-T-8-CE  CDP-A-AS-3-MS-5-T-8-CE  
^EOS
G-PWR,   CDP-A-MS-5-T-12-FT = 
CDP-A-MS-5-T-12-FT =                   OR    CDP-A-AS-1-MS-5-T-12-CE  CDP-A-AS-2-MS-5-T-12-CE  CDP-A-AS-3-MS-5-T-12-CE  
^EOS
G-PWR,   CDP-A-MS-5-T-16-FT = 
CDP-A-MS-5-T-16-FT =                   OR    CDP-A-AS-1-MS-5-T-16-CE  CDP-A-AS-2-MS-5-T-16-CE  CDP-A-AS-3-MS-5-T-16-CE  
^EOS
G-PWR,   CDP-A-MS-5-T-20-FT = 
CDP-A-MS-5-T-20-FT =                   OR    CDP-A-AS-1-MS-5-T-20-CE  CDP-A-AS-2-MS-5-T-20-CE  CDP-A-AS-3-MS-5-T-20-CE  
^EOS
G-PWR,  CDP-A-MS-6-AF-FT  = 
CDP-A-MS-6-T-8-FT                    TRAN
CDP-A-MS-6-T-12-FT                    TRAN
CDP-A-MS-6-T-16-FT                    TRAN
CDP-A-MS-6-T-20-FT                    TRAN
CDP-A-MS-6-AF-FT                  AND     HE-MS-6  CDP-A-MS-6-AF-GT1
CDP-A-MS-6-AF-GT1                    OR     CDP-A-MS-6-T-8-GT  CDP-A-MS-6-T-12-GT  CDP-A-MS-6-T-16-GT  CDP-A-MS-6-T-20-GT  
CDP-A-MS-6-T-8-GT                 AND   HE-T-8  CDP-A-MS-6-T-8-FT 
CDP-A-MS-6-T-12-GT                 AND   HE-T-12  CDP-A-MS-6-T-12-FT NOT-CDP-A-MS-6-T-8-AF-GT  
CDP-A-MS-6-T-16-GT                 AND   HE-T-16  CDP-A-MS-6-T-16-FT NOT-CDP-A-MS-6-T-8-AF-GT  NOT-CDP-A-MS-6-T-12-AF-GT  
CDP-A-MS-6-T-20-GT                 AND   HE-T-20  CDP-A-MS-6-T-20-FT NOT-CDP-A-MS-6-T-8-AF-GT  NOT-CDP-A-MS-6-T-12-AF-GT  NOT-CDP-A-MS-6-T-16-AF-GT  
NOT-CDP-A-MS-6-T-8-AF-GT             NOR   CDP-A-MS-6-T-8-FT
NOT-CDP-A-MS-6-T-12-AF-GT             NOR   CDP-A-MS-6-T-12-FT
NOT-CDP-A-MS-6-T-16-AF-GT             NOR   CDP-A-MS-6-T-16-FT
NOT-CDP-A-MS-6-T-20-AF-GT             NOR   CDP-A-MS-6-T-20-FT
^EOS
G-PWR,   CDP-A-MS-6-T-8-FT = 
CDP-A-MS-6-T-8-FT =                   OR    CDP-A-AS-1-MS-6-T-8-CE  CDP-A-AS-2-MS-6-T-8-CE  CDP-A-AS-3-MS-6-T-8-CE  
^EOS
G-PWR,   CDP-A-MS-6-T-12-FT = 
CDP-A-MS-6-T-12-FT =                   OR    CDP-A-AS-1-MS-6-T-12-CE  CDP-A-AS-2-MS-6-T-12-CE  CDP-A-AS-3-MS-6-T-12-CE  
^EOS
G-PWR,   CDP-A-MS-6-T-16-FT = 
CDP-A-MS-6-T-16-FT =                   OR    CDP-A-AS-1-MS-6-T-16-CE  CDP-A-AS-2-MS-6-T-16-CE  CDP-A-AS-3-MS-6-T-16-CE  
^EOS
G-PWR,   CDP-A-MS-6-T-20-FT = 
CDP-A-MS-6-T-20-FT =                   OR    CDP-A-AS-1-MS-6-T-20-CE  CDP-A-AS-2-MS-6-T-20-CE  CDP-A-AS-3-MS-6-T-20-CE  
^EOS
G-PWR,  CDP-A-MS-7-AF-FT  = 
CDP-A-MS-7-T-8-FT                    TRAN
CDP-A-MS-7-T-12-FT                    TRAN
CDP-A-MS-7-T-16-FT                    TRAN
CDP-A-MS-7-T-20-FT                    TRAN
CDP-A-MS-7-AF-FT                  AND     HE-MS-7  CDP-A-MS-7-AF-GT1
CDP-A-MS-7-AF-GT1                    OR     CDP-A-MS-7-T-8-GT  CDP-A-MS-7-T-12-GT  CDP-A-MS-7-T-16-GT  CDP-A-MS-7-T-20-GT  
CDP-A-MS-7-T-8-GT                 AND   HE-T-8  CDP-A-MS-7-T-8-FT 
CDP-A-MS-7-T-12-GT                 AND   HE-T-12  CDP-A-MS-7-T-12-FT NOT-CDP-A-MS-7-T-8-AF-GT  
CDP-A-MS-7-T-16-GT                 AND   HE-T-16  CDP-A-MS-7-T-16-FT NOT-CDP-A-MS-7-T-8-AF-GT  NOT-CDP-A-MS-7-T-12-AF-GT  
CDP-A-MS-7-T-20-GT                 AND   HE-T-20  CDP-A-MS-7-T-20-FT NOT-CDP-A-MS-7-T-8-AF-GT  NOT-CDP-A-MS-7-T-12-AF-GT  NOT-CDP-A-MS-7-T-16-AF-GT  
NOT-CDP-A-MS-7-T-8-AF-GT             NOR   CDP-A-MS-7-T-8-FT
NOT-CDP-A-MS-7-T-12-AF-GT             NOR   CDP-A-MS-7-T-12-FT
NOT-CDP-A-MS-7-T-16-AF-GT             NOR   CDP-A-MS-7-T-16-FT
NOT-CDP-A-MS-7-T-20-AF-GT             NOR   CDP-A-MS-7-T-20-FT
^EOS
G-PWR,   CDP-A-MS-7-T-8-FT = 
CDP-A-MS-7-T-8-FT =                   OR    CDP-A-AS-1-MS-7-T-8-CE  CDP-A-AS-2-MS-7-T-8-CE  CDP-A-AS-3-MS-7-T-8-CE  
^EOS
G-PWR,   CDP-A-MS-7-T-12-FT = 
CDP-A-MS-7-T-12-FT =                   OR    CDP-A-AS-1-MS-7-T-12-CE  CDP-A-AS-2-MS-7-T-12-CE  CDP-A-AS-3-MS-7-T-12-CE  
^EOS
G-PWR,   CDP-A-MS-7-T-16-FT = 
CDP-A-MS-7-T-16-FT =                   OR    CDP-A-AS-1-MS-7-T-16-CE  CDP-A-AS-2-MS-7-T-16-CE  CDP-A-AS-3-MS-7-T-16-CE  
^EOS
G-PWR,   CDP-A-MS-7-T-20-FT = 
CDP-A-MS-7-T-20-FT =                   OR    CDP-A-AS-1-MS-7-T-20-CE  CDP-A-AS-2-MS-7-T-20-CE  CDP-A-AS-3-MS-7-T-20-CE  
^EOS
G-PWR,  CDP-B-SEIS-FT =
CDP-B-MS-1-AF-FT                 TRAN
CDP-B-MS-2-AF-FT                 TRAN
CDP-B-MS-3-AF-FT                 TRAN
CDP-B-MS-4-AF-FT                 TRAN
CDP-B-MS-5-AF-FT                 TRAN
CDP-B-MS-6-AF-FT                 TRAN
CDP-B-MS-7-AF-FT                 TRAN
CDP-B-SEIS-FT                      OR  CDP-B-MS-FT  CDP-B-AS-GT
CDP-B-AS-GT                            AND CDP-B-AS-F-GT  NOT-CDP-B-MS-FT 
CDP-B-AS-F-GT                          OR  CDP-B-MS-1-AF-FT  CDP-B-MS-2-AF-FT  CDP-B-MS-3-AF-FT  CDP-B-MS-4-AF-FT  CDP-B-MS-5-AF-FT  CDP-B-MS-6-AF-FT  CDP-B-MS-7-AF-FT  
CDP-B-MS-FT                              TRAN
NOT-CDP-B-MS-FT            NOR CDP-B-MS-FT 
^EOS
G-PWR,  CDP-B-MS-1-AF-FT  = 
CDP-B-MS-1-T-8-FT                    TRAN
CDP-B-MS-1-T-12-FT                    TRAN
CDP-B-MS-1-T-16-FT                    TRAN
CDP-B-MS-1-T-20-FT                    TRAN
CDP-B-MS-1-AF-FT                  AND     HE-MS-1  CDP-B-MS-1-AF-GT1
CDP-B-MS-1-AF-GT1                    OR     CDP-B-MS-1-T-8-GT  CDP-B-MS-1-T-12-GT  CDP-B-MS-1-T-16-GT  CDP-B-MS-1-T-20-GT  
CDP-B-MS-1-T-8-GT                 AND   HE-T-8  CDP-B-MS-1-T-8-FT 
CDP-B-MS-1-T-12-GT                 AND   HE-T-12  CDP-B-MS-1-T-12-FT NOT-CDP-B-MS-1-T-8-AF-GT  
CDP-B-MS-1-T-16-GT                 AND   HE-T-16  CDP-B-MS-1-T-16-FT NOT-CDP-B-MS-1-T-8-AF-GT  NOT-CDP-B-MS-1-T-12-AF-GT  
CDP-B-MS-1-T-20-GT                 AND   HE-T-20  CDP-B-MS-1-T-20-FT NOT-CDP-B-MS-1-T-8-AF-GT  NOT-CDP-B-MS-1-T-12-AF-GT  NOT-CDP-B-MS-1-T-16-AF-GT  
NOT-CDP-B-MS-1-T-8-AF-GT             NOR   CDP-B-MS-1-T-8-FT
NOT-CDP-B-MS-1-T-12-AF-GT             NOR   CDP-B-MS-1-T-12-FT
NOT-CDP-B-MS-1-T-16-AF-GT             NOR   CDP-B-MS-1-T-16-FT
NOT-CDP-B-MS-1-T-20-AF-GT             NOR   CDP-B-MS-1-T-20-FT
^EOS
G-PWR,   CDP-B-MS-1-T-8-FT = 
CDP-B-MS-1-T-8-FT =                   OR    CDP-B-AS-1-MS-1-T-8-CE  CDP-B-AS-2-MS-1-T-8-CE  CDP-B-AS-3-MS-1-T-8-CE  
^EOS
G-PWR,   CDP-B-MS-1-T-12-FT = 
CDP-B-MS-1-T-12-FT =                   OR    CDP-B-AS-1-MS-1-T-12-CE  CDP-B-AS-2-MS-1-T-12-CE  CDP-B-AS-3-MS-1-T-12-CE  
^EOS
G-PWR,   CDP-B-MS-1-T-16-FT = 
CDP-B-MS-1-T-16-FT =                   OR    CDP-B-AS-1-MS-1-T-16-CE  CDP-B-AS-2-MS-1-T-16-CE  CDP-B-AS-3-MS-1-T-16-CE  
^EOS
G-PWR,   CDP-B-MS-1-T-20-FT = 
CDP-B-MS-1-T-20-FT =                   OR    CDP-B-AS-1-MS-1-T-20-CE  CDP-B-AS-2-MS-1-T-20-CE  CDP-B-AS-3-MS-1-T-20-CE  
^EOS
G-PWR,  CDP-B-MS-2-AF-FT  = 
CDP-B-MS-2-T-8-FT                    TRAN
CDP-B-MS-2-T-12-FT                    TRAN
CDP-B-MS-2-T-16-FT                    TRAN
CDP-B-MS-2-T-20-FT                    TRAN
CDP-B-MS-2-AF-FT                  AND     HE-MS-2  CDP-B-MS-2-AF-GT1
CDP-B-MS-2-AF-GT1                    OR     CDP-B-MS-2-T-8-GT  CDP-B-MS-2-T-12-GT  CDP-B-MS-2-T-16-GT  CDP-B-MS-2-T-20-GT  
CDP-B-MS-2-T-8-GT                 AND   HE-T-8  CDP-B-MS-2-T-8-FT 
CDP-B-MS-2-T-12-GT                 AND   HE-T-12  CDP-B-MS-2-T-12-FT NOT-CDP-B-MS-2-T-8-AF-GT  
CDP-B-MS-2-T-16-GT                 AND   HE-T-16  CDP-B-MS-2-T-16-FT NOT-CDP-B-MS-2-T-8-AF-GT  NOT-CDP-B-MS-2-T-12-AF-GT  
CDP-B-MS-2-T-20-GT                 AND   HE-T-20  CDP-B-MS-2-T-20-FT NOT-CDP-B-MS-2-T-8-AF-GT  NOT-CDP-B-MS-2-T-12-AF-GT  NOT-CDP-B-MS-2-T-16-AF-GT  
NOT-CDP-B-MS-2-T-8-AF-GT             NOR   CDP-B-MS-2-T-8-FT
NOT-CDP-B-MS-2-T-12-AF-GT             NOR   CDP-B-MS-2-T-12-FT
NOT-CDP-B-MS-2-T-16-AF-GT             NOR   CDP-B-MS-2-T-16-FT
NOT-CDP-B-MS-2-T-20-AF-GT             NOR   CDP-B-MS-2-T-20-FT
^EOS
G-PWR,   CDP-B-MS-2-T-8-FT = 
CDP-B-MS-2-T-8-FT =                   OR    CDP-B-AS-1-MS-2-T-8-CE  CDP-B-AS-2-MS-2-T-8-CE  CDP-B-AS-3-MS-2-T-8-CE  
^EOS
G-PWR,   CDP-B-MS-2-T-12-FT = 
CDP-B-MS-2-T-12-FT =                   OR    CDP-B-AS-1-MS-2-T-12-CE  CDP-B-AS-2-MS-2-T-12-CE  CDP-B-AS-3-MS-2-T-12-CE  
^EOS
G-PWR,   CDP-B-MS-2-T-16-FT = 
CDP-B-MS-2-T-16-FT =                   OR    CDP-B-AS-1-MS-2-T-16-CE  CDP-B-AS-2-MS-2-T-16-CE  CDP-B-AS-3-MS-2-T-16-CE  
^EOS
G-PWR,   CDP-B-MS-2-T-20-FT = 
CDP-B-MS-2-T-20-FT =                   OR    CDP-B-AS-1-MS-2-T-20-CE  CDP-B-AS-2-MS-2-T-20-CE  CDP-B-AS-3-MS-2-T-20-CE  
^EOS
G-PWR,  CDP-B-MS-3-AF-FT  = 
CDP-B-MS-3-T-8-FT                    TRAN
CDP-B-MS-3-T-12-FT                    TRAN
CDP-B-MS-3-T-16-FT                    TRAN
CDP-B-MS-3-T-20-FT                    TRAN
CDP-B-MS-3-AF-FT                  AND     HE-MS-3  CDP-B-MS-3-AF-GT1
CDP-B-MS-3-AF-GT1                    OR     CDP-B-MS-3-T-8-GT  CDP-B-MS-3-T-12-GT  CDP-B-MS-3-T-16-GT  CDP-B-MS-3-T-20-GT  
CDP-B-MS-3-T-8-GT                 AND   HE-T-8  CDP-B-MS-3-T-8-FT 
CDP-B-MS-3-T-12-GT                 AND   HE-T-12  CDP-B-MS-3-T-12-FT NOT-CDP-B-MS-3-T-8-AF-GT  
CDP-B-MS-3-T-16-GT                 AND   HE-T-16  CDP-B-MS-3-T-16-FT NOT-CDP-B-MS-3-T-8-AF-GT  NOT-CDP-B-MS-3-T-12-AF-GT  
CDP-B-MS-3-T-20-GT                 AND   HE-T-20  CDP-B-MS-3-T-20-FT NOT-CDP-B-MS-3-T-8-AF-GT  NOT-CDP-B-MS-3-T-12-AF-GT  NOT-CDP-B-MS-3-T-16-AF-GT  
NOT-CDP-B-MS-3-T-8-AF-GT             NOR   CDP-B-MS-3-T-8-FT
NOT-CDP-B-MS-3-T-12-AF-GT             NOR   CDP-B-MS-3-T-12-FT
NOT-CDP-B-MS-3-T-16-AF-GT             NOR   CDP-B-MS-3-T-16-FT
NOT-CDP-B-MS-3-T-20-AF-GT             NOR   CDP-B-MS-3-T-20-FT
^EOS
G-PWR,   CDP-B-MS-3-T-8-FT = 
CDP-B-MS-3-T-8-FT =                   OR    CDP-B-AS-1-MS-3-T-8-CE  CDP-B-AS-2-MS-3-T-8-CE  CDP-B-AS-3-MS-3-T-8-CE  
^EOS
G-PWR,   CDP-B-MS-3-T-12-FT = 
CDP-B-MS-3-T-12-FT =                   OR    CDP-B-AS-1-MS-3-T-12-CE  CDP-B-AS-2-MS-3-T-12-CE  CDP-B-AS-3-MS-3-T-12-CE  
^EOS
G-PWR,   CDP-B-MS-3-T-16-FT = 
CDP-B-MS-3-T-16-FT =                   OR    CDP-B-AS-1-MS-3-T-16-CE  CDP-B-AS-2-MS-3-T-16-CE  CDP-B-AS-3-MS-3-T-16-CE  
^EOS
G-PWR,   CDP-B-MS-3-T-20-FT = 
CDP-B-MS-3-T-20-FT =                   OR    CDP-B-AS-1-MS-3-T-20-CE  CDP-B-AS-2-MS-3-T-20-CE  CDP-B-AS-3-MS-3-T-20-CE  
^EOS
G-PWR,  CDP-B-MS-4-AF-FT  = 
CDP-B-MS-4-T-8-FT                    TRAN
CDP-B-MS-4-T-12-FT                    TRAN
CDP-B-MS-4-T-16-FT                    TRAN
CDP-B-MS-4-T-20-FT                    TRAN
CDP-B-MS-4-AF-FT                  AND     HE-MS-4  CDP-B-MS-4-AF-GT1
CDP-B-MS-4-AF-GT1                    OR     CDP-B-MS-4-T-8-GT  CDP-B-MS-4-T-12-GT  CDP-B-MS-4-T-16-GT  CDP-B-MS-4-T-20-GT  
CDP-B-MS-4-T-8-GT                 AND   HE-T-8  CDP-B-MS-4-T-8-FT 
CDP-B-MS-4-T-12-GT                 AND   HE-T-12  CDP-B-MS-4-T-12-FT NOT-CDP-B-MS-4-T-8-AF-GT  
CDP-B-MS-4-T-16-GT                 AND   HE-T-16  CDP-B-MS-4-T-16-FT NOT-CDP-B-MS-4-T-8-AF-GT  NOT-CDP-B-MS-4-T-12-AF-GT  
CDP-B-MS-4-T-20-GT                 AND   HE-T-20  CDP-B-MS-4-T-20-FT NOT-CDP-B-MS-4-T-8-AF-GT  NOT-CDP-B-MS-4-T-12-AF-GT  NOT-CDP-B-MS-4-T-16-AF-GT  
NOT-CDP-B-MS-4-T-8-AF-GT             NOR   CDP-B-MS-4-T-8-FT
NOT-CDP-B-MS-4-T-12-AF-GT             NOR   CDP-B-MS-4-T-12-FT
NOT-CDP-B-MS-4-T-16-AF-GT             NOR   CDP-B-MS-4-T-16-FT
NOT-CDP-B-MS-4-T-20-AF-GT             NOR   CDP-B-MS-4-T-20-FT
^EOS
G-PWR,   CDP-B-MS-4-T-8-FT = 
CDP-B-MS-4-T-8-FT =                   OR    CDP-B-AS-1-MS-4-T-8-CE  CDP-B-AS-2-MS-4-T-8-CE  CDP-B-AS-3-MS-4-T-8-CE  
^EOS
G-PWR,   CDP-B-MS-4-T-12-FT = 
CDP-B-MS-4-T-12-FT =                   OR    CDP-B-AS-1-MS-4-T-12-CE  CDP-B-AS-2-MS-4-T-12-CE  CDP-B-AS-3-MS-4-T-12-CE  
^EOS
G-PWR,   CDP-B-MS-4-T-16-FT = 
CDP-B-MS-4-T-16-FT =                   OR    CDP-B-AS-1-MS-4-T-16-CE  CDP-B-AS-2-MS-4-T-16-CE  CDP-B-AS-3-MS-4-T-16-CE  
^EOS
G-PWR,   CDP-B-MS-4-T-20-FT = 
CDP-B-MS-4-T-20-FT =                   OR    CDP-B-AS-1-MS-4-T-20-CE  CDP-B-AS-2-MS-4-T-20-CE  CDP-B-AS-3-MS-4-T-20-CE  
^EOS
G-PWR,  CDP-B-MS-5-AF-FT  = 
CDP-B-MS-5-T-8-FT                    TRAN
CDP-B-MS-5-T-12-FT                    TRAN
CDP-B-MS-5-T-16-FT                    TRAN
CDP-B-MS-5-T-20-FT                    TRAN
CDP-B-MS-5-AF-FT                  AND     HE-MS-5  CDP-B-MS-5-AF-GT1
CDP-B-MS-5-AF-GT1                    OR     CDP-B-MS-5-T-8-GT  CDP-B-MS-5-T-12-GT  CDP-B-MS-5-T-16-GT  CDP-B-MS-5-T-20-GT  
CDP-B-MS-5-T-8-GT                 AND   HE-T-8  CDP-B-MS-5-T-8-FT 
CDP-B-MS-5-T-12-GT                 AND   HE-T-12  CDP-B-MS-5-T-12-FT NOT-CDP-B-MS-5-T-8-AF-GT  
CDP-B-MS-5-T-16-GT                 AND   HE-T-16  CDP-B-MS-5-T-16-FT NOT-CDP-B-MS-5-T-8-AF-GT  NOT-CDP-B-MS-5-T-12-AF-GT  
CDP-B-MS-5-T-20-GT                 AND   HE-T-20  CDP-B-MS-5-T-20-FT NOT-CDP-B-MS-5-T-8-AF-GT  NOT-CDP-B-MS-5-T-12-AF-GT  NOT-CDP-B-MS-5-T-16-AF-GT  
NOT-CDP-B-MS-5-T-8-AF-GT             NOR   CDP-B-MS-5-T-8-FT
NOT-CDP-B-MS-5-T-12-AF-GT             NOR   CDP-B-MS-5-T-12-FT
NOT-CDP-B-MS-5-T-16-AF-GT             NOR   CDP-B-MS-5-T-16-FT
NOT-CDP-B-MS-5-T-20-AF-GT             NOR   CDP-B-MS-5-T-20-FT
^EOS
G-PWR,   CDP-B-MS-5-T-8-FT = 
CDP-B-MS-5-T-8-FT =                   OR    CDP-B-AS-1-MS-5-T-8-CE  CDP-B-AS-2-MS-5-T-8-CE  CDP-B-AS-3-MS-5-T-8-CE  
^EOS
G-PWR,   CDP-B-MS-5-T-12-FT = 
CDP-B-MS-5-T-12-FT =                   OR    CDP-B-AS-1-MS-5-T-12-CE  CDP-B-AS-2-MS-5-T-12-CE  CDP-B-AS-3-MS-5-T-12-CE  
^EOS
G-PWR,   CDP-B-MS-5-T-16-FT = 
CDP-B-MS-5-T-16-FT =                   OR    CDP-B-AS-1-MS-5-T-16-CE  CDP-B-AS-2-MS-5-T-16-CE  CDP-B-AS-3-MS-5-T-16-CE  
^EOS
G-PWR,   CDP-B-MS-5-T-20-FT = 
CDP-B-MS-5-T-20-FT =                   OR    CDP-B-AS-1-MS-5-T-20-CE  CDP-B-AS-2-MS-5-T-20-CE  CDP-B-AS-3-MS-5-T-20-CE  
^EOS
G-PWR,  CDP-B-MS-6-AF-FT  = 
CDP-B-MS-6-T-8-FT                    TRAN
CDP-B-MS-6-T-12-FT                    TRAN
CDP-B-MS-6-T-16-FT                    TRAN
CDP-B-MS-6-T-20-FT                    TRAN
CDP-B-MS-6-AF-FT                  AND     HE-MS-6  CDP-B-MS-6-AF-GT1
CDP-B-MS-6-AF-GT1                    OR     CDP-B-MS-6-T-8-GT  CDP-B-MS-6-T-12-GT  CDP-B-MS-6-T-16-GT  CDP-B-MS-6-T-20-GT  
CDP-B-MS-6-T-8-GT                 AND   HE-T-8  CDP-B-MS-6-T-8-FT 
CDP-B-MS-6-T-12-GT                 AND   HE-T-12  CDP-B-MS-6-T-12-FT NOT-CDP-B-MS-6-T-8-AF-GT  
CDP-B-MS-6-T-16-GT                 AND   HE-T-16  CDP-B-MS-6-T-16-FT NOT-CDP-B-MS-6-T-8-AF-GT  NOT-CDP-B-MS-6-T-12-AF-GT  
CDP-B-MS-6-T-20-GT                 AND   HE-T-20  CDP-B-MS-6-T-20-FT NOT-CDP-B-MS-6-T-8-AF-GT  NOT-CDP-B-MS-6-T-12-AF-GT  NOT-CDP-B-MS-6-T-16-AF-GT  
NOT-CDP-B-MS-6-T-8-AF-GT             NOR   CDP-B-MS-6-T-8-FT
NOT-CDP-B-MS-6-T-12-AF-GT             NOR   CDP-B-MS-6-T-12-FT
NOT-CDP-B-MS-6-T-16-AF-GT             NOR   CDP-B-MS-6-T-16-FT
NOT-CDP-B-MS-6-T-20-AF-GT             NOR   CDP-B-MS-6-T-20-FT
^EOS
G-PWR,   CDP-B-MS-6-T-8-FT = 
CDP-B-MS-6-T-8-FT =                   OR    CDP-B-AS-1-MS-6-T-8-CE  CDP-B-AS-2-MS-6-T-8-CE  CDP-B-AS-3-MS-6-T-8-CE  
^EOS
G-PWR,   CDP-B-MS-6-T-12-FT = 
CDP-B-MS-6-T-12-FT =                   OR    CDP-B-AS-1-MS-6-T-12-CE  CDP-B-AS-2-MS-6-T-12-CE  CDP-B-AS-3-MS-6-T-12-CE  
^EOS
G-PWR,   CDP-B-MS-6-T-16-FT = 
CDP-B-MS-6-T-16-FT =                   OR    CDP-B-AS-1-MS-6-T-16-CE  CDP-B-AS-2-MS-6-T-16-CE  CDP-B-AS-3-MS-6-T-16-CE  
^EOS
G-PWR,   CDP-B-MS-6-T-20-FT = 
CDP-B-MS-6-T-20-FT =                   OR    CDP-B-AS-1-MS-6-T-20-CE  CDP-B-AS-2-MS-6-T-20-CE  CDP-B-AS-3-MS-6-T-20-CE  
^EOS
G-PWR,  CDP-B-MS-7-AF-FT  = 
CDP-B-MS-7-T-8-FT                    TRAN
CDP-B-MS-7-T-12-FT                    TRAN
CDP-B-MS-7-T-16-FT                    TRAN
CDP-B-MS-7-T-20-FT                    TRAN
CDP-B-MS-7-AF-FT                  AND     HE-MS-7  CDP-B-MS-7-AF-GT1
CDP-B-MS-7-AF-GT1                    OR     CDP-B-MS-7-T-8-GT  CDP-B-MS-7-T-12-GT  CDP-B-MS-7-T-16-GT  CDP-B-MS-7-T-20-GT  
CDP-B-MS-7-T-8-GT                 AND   HE-T-8  CDP-B-MS-7-T-8-FT 
CDP-B-MS-7-T-12-GT                 AND   HE-T-12  CDP-B-MS-7-T-12-FT NOT-CDP-B-MS-7-T-8-AF-GT  
CDP-B-MS-7-T-16-GT                 AND   HE-T-16  CDP-B-MS-7-T-16-FT NOT-CDP-B-MS-7-T-8-AF-GT  NOT-CDP-B-MS-7-T-12-AF-GT  
CDP-B-MS-7-T-20-GT                 AND   HE-T-20  CDP-B-MS-7-T-20-FT NOT-CDP-B-MS-7-T-8-AF-GT  NOT-CDP-B-MS-7-T-12-AF-GT  NOT-CDP-B-MS-7-T-16-AF-GT  
NOT-CDP-B-MS-7-T-8-AF-GT             NOR   CDP-B-MS-7-T-8-FT
NOT-CDP-B-MS-7-T-12-AF-GT             NOR   CDP-B-MS-7-T-12-FT
NOT-CDP-B-MS-7-T-16-AF-GT             NOR   CDP-B-MS-7-T-16-FT
NOT-CDP-B-MS-7-T-20-AF-GT             NOR   CDP-B-MS-7-T-20-FT
^EOS
G-PWR,   CDP-B-MS-7-T-8-FT = 
CDP-B-MS-7-T-8-FT =                   OR    CDP-B-AS-1-MS-7-T-8-CE  CDP-B-AS-2-MS-7-T-8-CE  CDP-B-AS-3-MS-7-T-8-CE  
^EOS
G-PWR,   CDP-B-MS-7-T-12-FT = 
CDP-B-MS-7-T-12-FT =                   OR    CDP-B-AS-1-MS-7-T-12-CE  CDP-B-AS-2-MS-7-T-12-CE  CDP-B-AS-3-MS-7-T-12-CE  
^EOS
G-PWR,   CDP-B-MS-7-T-16-FT = 
CDP-B-MS-7-T-16-FT =                   OR    CDP-B-AS-1-MS-7-T-16-CE  CDP-B-AS-2-MS-7-T-16-CE  CDP-B-AS-3-MS-7-T-16-CE  
^EOS
G-PWR,   CDP-B-MS-7-T-20-FT = 
CDP-B-MS-7-T-20-FT =                   OR    CDP-B-AS-1-MS-7-T-20-CE  CDP-B-AS-2-MS-7-T-20-CE  CDP-B-AS-3-MS-7-T-20-CE  
^EOS
G-PWR,  CDP-C-SEIS-FT =
CDP-C-MS-1-AF-FT                 TRAN
CDP-C-MS-2-AF-FT                 TRAN
CDP-C-MS-3-AF-FT                 TRAN
CDP-C-MS-4-AF-FT                 TRAN
CDP-C-MS-5-AF-FT                 TRAN
CDP-C-MS-6-AF-FT                 TRAN
CDP-C-MS-7-AF-FT                 TRAN
CDP-C-SEIS-FT                      OR  CDP-C-MS-FT  CDP-C-AS-GT
CDP-C-AS-GT                            AND CDP-C-AS-F-GT  NOT-CDP-C-MS-FT 
CDP-C-AS-F-GT                          OR  CDP-C-MS-1-AF-FT  CDP-C-MS-2-AF-FT  CDP-C-MS-3-AF-FT  CDP-C-MS-4-AF-FT  CDP-C-MS-5-AF-FT  CDP-C-MS-6-AF-FT  CDP-C-MS-7-AF-FT  
CDP-C-MS-FT                              TRAN
NOT-CDP-C-MS-FT            NOR CDP-C-MS-FT 
^EOS
G-PWR,  CDP-C-MS-1-AF-FT  = 
CDP-C-MS-1-T-8-FT                    TRAN
CDP-C-MS-1-T-12-FT                    TRAN
CDP-C-MS-1-T-16-FT                    TRAN
CDP-C-MS-1-T-20-FT                    TRAN
CDP-C-MS-1-AF-FT                  AND     HE-MS-1  CDP-C-MS-1-AF-GT1
CDP-C-MS-1-AF-GT1                    OR     CDP-C-MS-1-T-8-GT  CDP-C-MS-1-T-12-GT  CDP-C-MS-1-T-16-GT  CDP-C-MS-1-T-20-GT  
CDP-C-MS-1-T-8-GT                 AND   HE-T-8  CDP-C-MS-1-T-8-FT 
CDP-C-MS-1-T-12-GT                 AND   HE-T-12  CDP-C-MS-1-T-12-FT NOT-CDP-C-MS-1-T-8-AF-GT  
CDP-C-MS-1-T-16-GT                 AND   HE-T-16  CDP-C-MS-1-T-16-FT NOT-CDP-C-MS-1-T-8-AF-GT  NOT-CDP-C-MS-1-T-12-AF-GT  
CDP-C-MS-1-T-20-GT                 AND   HE-T-20  CDP-C-MS-1-T-20-FT NOT-CDP-C-MS-1-T-8-AF-GT  NOT-CDP-C-MS-1-T-12-AF-GT  NOT-CDP-C-MS-1-T-16-AF-GT  
NOT-CDP-C-MS-1-T-8-AF-GT             NOR   CDP-C-MS-1-T-8-FT
NOT-CDP-C-MS-1-T-12-AF-GT             NOR   CDP-C-MS-1-T-12-FT
NOT-CDP-C-MS-1-T-16-AF-GT             NOR   CDP-C-MS-1-T-16-FT
NOT-CDP-C-MS-1-T-20-AF-GT             NOR   CDP-C-MS-1-T-20-FT
^EOS
G-PWR,   CDP-C-MS-1-T-8-FT = 
CDP-C-MS-1-T-8-FT =                   OR    CDP-C-AS-1-MS-1-T-8-CE  CDP-C-AS-2-MS-1-T-8-CE  CDP-C-AS-3-MS-1-T-8-CE  
^EOS
G-PWR,   CDP-C-MS-1-T-12-FT = 
CDP-C-MS-1-T-12-FT =                   OR    CDP-C-AS-1-MS-1-T-12-CE  CDP-C-AS-2-MS-1-T-12-CE  CDP-C-AS-3-MS-1-T-12-CE  
^EOS
G-PWR,   CDP-C-MS-1-T-16-FT = 
CDP-C-MS-1-T-16-FT =                   OR    CDP-C-AS-1-MS-1-T-16-CE  CDP-C-AS-2-MS-1-T-16-CE  CDP-C-AS-3-MS-1-T-16-CE  
^EOS
G-PWR,   CDP-C-MS-1-T-20-FT = 
CDP-C-MS-1-T-20-FT =                   OR    CDP-C-AS-1-MS-1-T-20-CE  CDP-C-AS-2-MS-1-T-20-CE  CDP-C-AS-3-MS-1-T-20-CE  
^EOS
G-PWR,  CDP-C-MS-2-AF-FT  = 
CDP-C-MS-2-T-8-FT                    TRAN
CDP-C-MS-2-T-12-FT                    TRAN
CDP-C-MS-2-T-16-FT                    TRAN
CDP-C-MS-2-T-20-FT                    TRAN
CDP-C-MS-2-AF-FT                  AND     HE-MS-2  CDP-C-MS-2-AF-GT1
CDP-C-MS-2-AF-GT1                    OR     CDP-C-MS-2-T-8-GT  CDP-C-MS-2-T-12-GT  CDP-C-MS-2-T-16-GT  CDP-C-MS-2-T-20-GT  
CDP-C-MS-2-T-8-GT                 AND   HE-T-8  CDP-C-MS-2-T-8-FT 
CDP-C-MS-2-T-12-GT                 AND   HE-T-12  CDP-C-MS-2-T-12-FT NOT-CDP-C-MS-2-T-8-AF-GT  
CDP-C-MS-2-T-16-GT                 AND   HE-T-16  CDP-C-MS-2-T-16-FT NOT-CDP-C-MS-2-T-8-AF-GT  NOT-CDP-C-MS-2-T-12-AF-GT  
CDP-C-MS-2-T-20-GT                 AND   HE-T-20  CDP-C-MS-2-T-20-FT NOT-CDP-C-MS-2-T-8-AF-GT  NOT-CDP-C-MS-2-T-12-AF-GT  NOT-CDP-C-MS-2-T-16-AF-GT  
NOT-CDP-C-MS-2-T-8-AF-GT             NOR   CDP-C-MS-2-T-8-FT
NOT-CDP-C-MS-2-T-12-AF-GT             NOR   CDP-C-MS-2-T-12-FT
NOT-CDP-C-MS-2-T-16-AF-GT             NOR   CDP-C-MS-2-T-16-FT
NOT-CDP-C-MS-2-T-20-AF-GT             NOR   CDP-C-MS-2-T-20-FT
^EOS
G-PWR,   CDP-C-MS-2-T-8-FT = 
CDP-C-MS-2-T-8-FT =                   OR    CDP-C-AS-1-MS-2-T-8-CE  CDP-C-AS-2-MS-2-T-8-CE  CDP-C-AS-3-MS-2-T-8-CE  
^EOS
G-PWR,   CDP-C-MS-2-T-12-FT = 
CDP-C-MS-2-T-12-FT =                   OR    CDP-C-AS-1-MS-2-T-12-CE  CDP-C-AS-2-MS-2-T-12-CE  CDP-C-AS-3-MS-2-T-12-CE  
^EOS
G-PWR,   CDP-C-MS-2-T-16-FT = 
CDP-C-MS-2-T-16-FT =                   OR    CDP-C-AS-1-MS-2-T-16-CE  CDP-C-AS-2-MS-2-T-16-CE  CDP-C-AS-3-MS-2-T-16-CE  
^EOS
G-PWR,   CDP-C-MS-2-T-20-FT = 
CDP-C-MS-2-T-20-FT =                   OR    CDP-C-AS-1-MS-2-T-20-CE  CDP-C-AS-2-MS-2-T-20-CE  CDP-C-AS-3-MS-2-T-20-CE  
^EOS
G-PWR,  CDP-C-MS-3-AF-FT  = 
CDP-C-MS-3-T-8-FT                    TRAN
CDP-C-MS-3-T-12-FT                    TRAN
CDP-C-MS-3-T-16-FT                    TRAN
CDP-C-MS-3-T-20-FT                    TRAN
CDP-C-MS-3-AF-FT                  AND     HE-MS-3  CDP-C-MS-3-AF-GT1
CDP-C-MS-3-AF-GT1                    OR     CDP-C-MS-3-T-8-GT  CDP-C-MS-3-T-12-GT  CDP-C-MS-3-T-16-GT  CDP-C-MS-3-T-20-GT  
CDP-C-MS-3-T-8-GT                 AND   HE-T-8  CDP-C-MS-3-T-8-FT 
CDP-C-MS-3-T-12-GT                 AND   HE-T-12  CDP-C-MS-3-T-12-FT NOT-CDP-C-MS-3-T-8-AF-GT  
CDP-C-MS-3-T-16-GT                 AND   HE-T-16  CDP-C-MS-3-T-16-FT NOT-CDP-C-MS-3-T-8-AF-GT  NOT-CDP-C-MS-3-T-12-AF-GT  
CDP-C-MS-3-T-20-GT                 AND   HE-T-20  CDP-C-MS-3-T-20-FT NOT-CDP-C-MS-3-T-8-AF-GT  NOT-CDP-C-MS-3-T-12-AF-GT  NOT-CDP-C-MS-3-T-16-AF-GT  
NOT-CDP-C-MS-3-T-8-AF-GT             NOR   CDP-C-MS-3-T-8-FT
NOT-CDP-C-MS-3-T-12-AF-GT             NOR   CDP-C-MS-3-T-12-FT
NOT-CDP-C-MS-3-T-16-AF-GT             NOR   CDP-C-MS-3-T-16-FT
NOT-CDP-C-MS-3-T-20-AF-GT             NOR   CDP-C-MS-3-T-20-FT
^EOS
G-PWR,   CDP-C-MS-3-T-8-FT = 
CDP-C-MS-3-T-8-FT =                   OR    CDP-C-AS-1-MS-3-T-8-CE  CDP-C-AS-2-MS-3-T-8-CE  CDP-C-AS-3-MS-3-T-8-CE  
^EOS
G-PWR,   CDP-C-MS-3-T-12-FT = 
CDP-C-MS-3-T-12-FT =                   OR    CDP-C-AS-1-MS-3-T-12-CE  CDP-C-AS-2-MS-3-T-12-CE  CDP-C-AS-3-MS-3-T-12-CE  
^EOS
G-PWR,   CDP-C-MS-3-T-16-FT = 
CDP-C-MS-3-T-16-FT =                   OR    CDP-C-AS-1-MS-3-T-16-CE  CDP-C-AS-2-MS-3-T-16-CE  CDP-C-AS-3-MS-3-T-16-CE  
^EOS
G-PWR,   CDP-C-MS-3-T-20-FT = 
CDP-C-MS-3-T-20-FT =                   OR    CDP-C-AS-1-MS-3-T-20-CE  CDP-C-AS-2-MS-3-T-20-CE  CDP-C-AS-3-MS-3-T-20-CE  
^EOS
G-PWR,  CDP-C-MS-4-AF-FT  = 
CDP-C-MS-4-T-8-FT                    TRAN
CDP-C-MS-4-T-12-FT                    TRAN
CDP-C-MS-4-T-16-FT                    TRAN
CDP-C-MS-4-T-20-FT                    TRAN
CDP-C-MS-4-AF-FT                  AND     HE-MS-4  CDP-C-MS-4-AF-GT1
CDP-C-MS-4-AF-GT1                    OR     CDP-C-MS-4-T-8-GT  CDP-C-MS-4-T-12-GT  CDP-C-MS-4-T-16-GT  CDP-C-MS-4-T-20-GT  
CDP-C-MS-4-T-8-GT                 AND   HE-T-8  CDP-C-MS-4-T-8-FT 
CDP-C-MS-4-T-12-GT                 AND   HE-T-12  CDP-C-MS-4-T-12-FT NOT-CDP-C-MS-4-T-8-AF-GT  
CDP-C-MS-4-T-16-GT                 AND   HE-T-16  CDP-C-MS-4-T-16-FT NOT-CDP-C-MS-4-T-8-AF-GT  NOT-CDP-C-MS-4-T-12-AF-GT  
CDP-C-MS-4-T-20-GT                 AND   HE-T-20  CDP-C-MS-4-T-20-FT NOT-CDP-C-MS-4-T-8-AF-GT  NOT-CDP-C-MS-4-T-12-AF-GT  NOT-CDP-C-MS-4-T-16-AF-GT  
NOT-CDP-C-MS-4-T-8-AF-GT             NOR   CDP-C-MS-4-T-8-FT
NOT-CDP-C-MS-4-T-12-AF-GT             NOR   CDP-C-MS-4-T-12-FT
NOT-CDP-C-MS-4-T-16-AF-GT             NOR   CDP-C-MS-4-T-16-FT
NOT-CDP-C-MS-4-T-20-AF-GT             NOR   CDP-C-MS-4-T-20-FT
^EOS
G-PWR,   CDP-C-MS-4-T-8-FT = 
CDP-C-MS-4-T-8-FT =                   OR    CDP-C-AS-1-MS-4-T-8-CE  CDP-C-AS-2-MS-4-T-8-CE  CDP-C-AS-3-MS-4-T-8-CE  
^EOS
G-PWR,   CDP-C-MS-4-T-12-FT = 
CDP-C-MS-4-T-12-FT =                   OR    CDP-C-AS-1-MS-4-T-12-CE  CDP-C-AS-2-MS-4-T-12-CE  CDP-C-AS-3-MS-4-T-12-CE  
^EOS
G-PWR,   CDP-C-MS-4-T-16-FT = 
CDP-C-MS-4-T-16-FT =                   OR    CDP-C-AS-1-MS-4-T-16-CE  CDP-C-AS-2-MS-4-T-16-CE  CDP-C-AS-3-MS-4-T-16-CE  
^EOS
G-PWR,   CDP-C-MS-4-T-20-FT = 
CDP-C-MS-4-T-20-FT =                   OR    CDP-C-AS-1-MS-4-T-20-CE  CDP-C-AS-2-MS-4-T-20-CE  CDP-C-AS-3-MS-4-T-20-CE  
^EOS
G-PWR,  CDP-C-MS-5-AF-FT  = 
CDP-C-MS-5-T-8-FT                    TRAN
CDP-C-MS-5-T-12-FT                    TRAN
CDP-C-MS-5-T-16-FT                    TRAN
CDP-C-MS-5-T-20-FT                    TRAN
CDP-C-MS-5-AF-FT                  AND     HE-MS-5  CDP-C-MS-5-AF-GT1
CDP-C-MS-5-AF-GT1                    OR     CDP-C-MS-5-T-8-GT  CDP-C-MS-5-T-12-GT  CDP-C-MS-5-T-16-GT  CDP-C-MS-5-T-20-GT  
CDP-C-MS-5-T-8-GT                 AND   HE-T-8  CDP-C-MS-5-T-8-FT 
CDP-C-MS-5-T-12-GT                 AND   HE-T-12  CDP-C-MS-5-T-12-FT NOT-CDP-C-MS-5-T-8-AF-GT  
CDP-C-MS-5-T-16-GT                 AND   HE-T-16  CDP-C-MS-5-T-16-FT NOT-CDP-C-MS-5-T-8-AF-GT  NOT-CDP-C-MS-5-T-12-AF-GT  
CDP-C-MS-5-T-20-GT                 AND   HE-T-20  CDP-C-MS-5-T-20-FT NOT-CDP-C-MS-5-T-8-AF-GT  NOT-CDP-C-MS-5-T-12-AF-GT  NOT-CDP-C-MS-5-T-16-AF-GT  
NOT-CDP-C-MS-5-T-8-AF-GT             NOR   CDP-C-MS-5-T-8-FT
NOT-CDP-C-MS-5-T-12-AF-GT             NOR   CDP-C-MS-5-T-12-FT
NOT-CDP-C-MS-5-T-16-AF-GT             NOR   CDP-C-MS-5-T-16-FT
NOT-CDP-C-MS-5-T-20-AF-GT             NOR   CDP-C-MS-5-T-20-FT
^EOS
G-PWR,   CDP-C-MS-5-T-8-FT = 
CDP-C-MS-5-T-8-FT =                   OR    CDP-C-AS-1-MS-5-T-8-CE  CDP-C-AS-2-MS-5-T-8-CE  CDP-C-AS-3-MS-5-T-8-CE  
^EOS
G-PWR,   CDP-C-MS-5-T-12-FT = 
CDP-C-MS-5-T-12-FT =                   OR    CDP-C-AS-1-MS-5-T-12-CE  CDP-C-AS-2-MS-5-T-12-CE  CDP-C-AS-3-MS-5-T-12-CE  
^EOS
G-PWR,   CDP-C-MS-5-T-16-FT = 
CDP-C-MS-5-T-16-FT =                   OR    CDP-C-AS-1-MS-5-T-16-CE  CDP-C-AS-2-MS-5-T-16-CE  CDP-C-AS-3-MS-5-T-16-CE  
^EOS
G-PWR,   CDP-C-MS-5-T-20-FT = 
CDP-C-MS-5-T-20-FT =                   OR    CDP-C-AS-1-MS-5-T-20-CE  CDP-C-AS-2-MS-5-T-20-CE  CDP-C-AS-3-MS-5-T-20-CE  
^EOS
G-PWR,  CDP-C-MS-6-AF-FT  = 
CDP-C-MS-6-T-8-FT                    TRAN
CDP-C-MS-6-T-12-FT                    TRAN
CDP-C-MS-6-T-16-FT                    TRAN
CDP-C-MS-6-T-20-FT                    TRAN
CDP-C-MS-6-AF-FT                  AND     HE-MS-6  CDP-C-MS-6-AF-GT1
CDP-C-MS-6-AF-GT1                    OR     CDP-C-MS-6-T-8-GT  CDP-C-MS-6-T-12-GT  CDP-C-MS-6-T-16-GT  CDP-C-MS-6-T-20-GT  
CDP-C-MS-6-T-8-GT                 AND   HE-T-8  CDP-C-MS-6-T-8-FT 
CDP-C-MS-6-T-12-GT                 AND   HE-T-12  CDP-C-MS-6-T-12-FT NOT-CDP-C-MS-6-T-8-AF-GT  
CDP-C-MS-6-T-16-GT                 AND   HE-T-16  CDP-C-MS-6-T-16-FT NOT-CDP-C-MS-6-T-8-AF-GT  NOT-CDP-C-MS-6-T-12-AF-GT  
CDP-C-MS-6-T-20-GT                 AND   HE-T-20  CDP-C-MS-6-T-20-FT NOT-CDP-C-MS-6-T-8-AF-GT  NOT-CDP-C-MS-6-T-12-AF-GT  NOT-CDP-C-MS-6-T-16-AF-GT  
NOT-CDP-C-MS-6-T-8-AF-GT             NOR   CDP-C-MS-6-T-8-FT
NOT-CDP-C-MS-6-T-12-AF-GT             NOR   CDP-C-MS-6-T-12-FT
NOT-CDP-C-MS-6-T-16-AF-GT             NOR   CDP-C-MS-6-T-16-FT
NOT-CDP-C-MS-6-T-20-AF-GT             NOR   CDP-C-MS-6-T-20-FT
^EOS
G-PWR,   CDP-C-MS-6-T-8-FT = 
CDP-C-MS-6-T-8-FT =                   OR    CDP-C-AS-1-MS-6-T-8-CE  CDP-C-AS-2-MS-6-T-8-CE  CDP-C-AS-3-MS-6-T-8-CE  
^EOS
G-PWR,   CDP-C-MS-6-T-12-FT = 
CDP-C-MS-6-T-12-FT =                   OR    CDP-C-AS-1-MS-6-T-12-CE  CDP-C-AS-2-MS-6-T-12-CE  CDP-C-AS-3-MS-6-T-12-CE  
^EOS
G-PWR,   CDP-C-MS-6-T-16-FT = 
CDP-C-MS-6-T-16-FT =                   OR    CDP-C-AS-1-MS-6-T-16-CE  CDP-C-AS-2-MS-6-T-16-CE  CDP-C-AS-3-MS-6-T-16-CE  
^EOS
G-PWR,   CDP-C-MS-6-T-20-FT = 
CDP-C-MS-6-T-20-FT =                   OR    CDP-C-AS-1-MS-6-T-20-CE  CDP-C-AS-2-MS-6-T-20-CE  CDP-C-AS-3-MS-6-T-20-CE  
^EOS
G-PWR,  CDP-C-MS-7-AF-FT  = 
CDP-C-MS-7-T-8-FT                    TRAN
CDP-C-MS-7-T-12-FT                    TRAN
CDP-C-MS-7-T-16-FT                    TRAN
CDP-C-MS-7-T-20-FT                    TRAN
CDP-C-MS-7-AF-FT                  AND     HE-MS-7  CDP-C-MS-7-AF-GT1
CDP-C-MS-7-AF-GT1                    OR     CDP-C-MS-7-T-8-GT  CDP-C-MS-7-T-12-GT  CDP-C-MS-7-T-16-GT  CDP-C-MS-7-T-20-GT  
CDP-C-MS-7-T-8-GT                 AND   HE-T-8  CDP-C-MS-7-T-8-FT 
CDP-C-MS-7-T-12-GT                 AND   HE-T-12  CDP-C-MS-7-T-12-FT NOT-CDP-C-MS-7-T-8-AF-GT  
CDP-C-MS-7-T-16-GT                 AND   HE-T-16  CDP-C-MS-7-T-16-FT NOT-CDP-C-MS-7-T-8-AF-GT  NOT-CDP-C-MS-7-T-12-AF-GT  
CDP-C-MS-7-T-20-GT                 AND   HE-T-20  CDP-C-MS-7-T-20-FT NOT-CDP-C-MS-7-T-8-AF-GT  NOT-CDP-C-MS-7-T-12-AF-GT  NOT-CDP-C-MS-7-T-16-AF-GT  
NOT-CDP-C-MS-7-T-8-AF-GT             NOR   CDP-C-MS-7-T-8-FT
NOT-CDP-C-MS-7-T-12-AF-GT             NOR   CDP-C-MS-7-T-12-FT
NOT-CDP-C-MS-7-T-16-AF-GT             NOR   CDP-C-MS-7-T-16-FT
NOT-CDP-C-MS-7-T-20-AF-GT             NOR   CDP-C-MS-7-T-20-FT
^EOS
G-PWR,   CDP-C-MS-7-T-8-FT = 
CDP-C-MS-7-T-8-FT =                   OR    CDP-C-AS-1-MS-7-T-8-CE  CDP-C-AS-2-MS-7-T-8-CE  CDP-C-AS-3-MS-7-T-8-CE  
^EOS
G-PWR,   CDP-C-MS-7-T-12-FT = 
CDP-C-MS-7-T-12-FT =                   OR    CDP-C-AS-1-MS-7-T-12-CE  CDP-C-AS-2-MS-7-T-12-CE  CDP-C-AS-3-MS-7-T-12-CE  
^EOS
G-PWR,   CDP-C-MS-7-T-16-FT = 
CDP-C-MS-7-T-16-FT =                   OR    CDP-C-AS-1-MS-7-T-16-CE  CDP-C-AS-2-MS-7-T-16-CE  CDP-C-AS-3-MS-7-T-16-CE  
^EOS
G-PWR,   CDP-C-MS-7-T-20-FT = 
CDP-C-MS-7-T-20-FT =                   OR    CDP-C-AS-1-MS-7-T-20-CE  CDP-C-AS-2-MS-7-T-20-CE  CDP-C-AS-3-MS-7-T-20-CE  
^EOS
