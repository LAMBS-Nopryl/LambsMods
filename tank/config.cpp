class CfgPatches
{
  class lambs_tank
  {
    units[] = {
        "LAMBS_MBT_03_cannon_F",
        "LAMBS_APC_tracked_03_cannon_F"
    };
    weapons[] = {};
    requiredVersion = 1.82;
    requiredAddons[] = {
        "A3_armor_F_EPB"
    };
    version = "1.0"; 
    versionStr = "1.0";
    author = "nopryl.no";
    authorUrl = "http://www.nopryl.no";
  };
};

class cfgVehicles {
    class I_MBT_03_cannon_F;
    class LAMBS_MBT_03_cannon_F : I_MBT_03_cannon_F {
        author = "nopryl.no";
        side = 1;
        crew = "B_crew_F";
        hiddenSelectionsTextures[] = {
            "\tank\data\texture\mbt0.paa",
            "\tank\data\texture\mbt1.paa",
            "\tank\data\texture\mbt2.paa",
            "A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa"
        };
        class TextureSources {
            class noprylGreen {
                author = "nopryl.no";
                displayName = "Olive Drab";
                factions[] = {"IND_F"}; //BLU_F
                textures[] = {
                        "\tank\data\texture\mbt0.paa",
                        "\tank\data\texture\mbt1.paa",
                        "\tank\data\texture\mbt2.paa",
                        "A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa"
                };
            };
            class noprylJungle {
                author = "nopryl.no";
                displayName = "Olive Drab (Jungle)";
                factions[] = {"IND_F"};
                textures[] = {
                        "\tank\data\texture\mbt0.paa",
                        "\tank\data\texture\mbt1.paa",
                        "\tank\data\texture\mbt2.paa",
                        "A3\Armor_F\Data\camonet_AAF_Digi_Jungle_CO.paa"
                };
            };
            class noprylDesert {
                author = "nopryl.no";
                displayName = "Olive Drab (Desert)";
                factions[] = {"IND_F"};
                textures[] = {
                        "\tank\data\texture\mbt_desert0.paa",
                        "\tank\data\texture\mbt_desert1.paa",
                        "\tank\data\texture\mbt_desert2.paa",
                        "A3\Armor_F\Data\camonet_AAF_Digi_Desert_CO.paa"
                };
            };
        };
    };

    class I_APC_tracked_03_cannon_F; 
    class LAMBS_APC_tracked_03_cannon_F : I_APC_tracked_03_cannon_F {
        side = 1; 
        author = "nopryl.no";
        crew = "B_crew_F";
        hiddenSelectionsTextures[] = {
            "\tank\data\texture\apc0.paa",
            "\tank\data\texture\apc1.paa",
            "A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa",
            "A3\armor_f\data\cage_aaf_co.paa"
        };
        class TextureSources {
            class noprylGreen {
                author = "nopryl.no";
                displayName = "Olive Drab";
                factions[] = {"IND_F"};
                textures[] = {
                        "\tank\data\texture\apc0.paa",
                        "\tank\data\texture\apc1.paa",
                        "A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa",
                        "A3\armor_f\data\cage_aaf_co.paa"
                };
            }; 
            class noprylDesert {
                author = "nopryl.no";
                displayName = "Olive Drab (Desert)";
                factions[] = {"IND_F"};
                textures[] = {
                        "\tank\data\texture\apc_desert0.paa",
                        "\tank\data\texture\apc_desert1.paa",
                        "A3\Armor_F\Data\camonet_AAF_Digi_Desert_CO.paa",
                        "A3\armor_f\data\cage_aaf_co.paa"
                };
            };         
        }; 
    };
};

