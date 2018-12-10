# 1.1 Load libraries & Dataset ####
library(arules)

library(arulesViz)

library(pacman)

# Uploading Dataset
ElectronTrans <- read.transactions("ElectronidexTransactions2017.csv", 
                   format = "basket", sep=",", rm.duplicates=FALSE)

View(ElectronTrans)

# 1.2 Getting to know my data ####
inspect(ElectronTrans)

length(ElectronTrans)

size(ElectronTrans)

ElectronTrans_items <- LIST(ElectronTrans)

ElectronTrans_items

ElectronTrans_labels <- itemLabels(ElectronTrans)

View(ElectronTrans_labels)


# 1.3 Rename Variables ####
namesElectronTrans<-itemLabels(ElectronTrans)

myLabels<- c("ExternalHardrives_1TB_Portable_External_Hard_Drive", 
"ExternalHardrives_2TB_Portable_External_Hard_Drive", 
              "ComputerMice_3-Button_Mouse",
              "ExternalHardrives_3TB_Portable_External_Hard_Drive",
              "ExternalHardrives_5TB_Desktop_Hard_Drive",
              "Monitor_AOC_Monitor",
              "ActiveHeadphones_APIE_Bluetooth_Headphone",
              "Monitor_ASUS_2_Monitor",
              "Laptop_ASUS_Chromebook",
              "Desktop_ASUS_Desktop",
              "Monitor_ASUS_Monitor",
              "Laptop_Acer_Aspire",
              "Desktop_Acer_Desktop",
              "Monitor_Acer_Monitor",
              "ComputerHeadphones_Ailihen_Stereo_Headphones",
              "Laptop_Alienware_Laptop",
              "ActiveHeadphones_Apple_Earpods",
              "Laptop_Apple_MacBook_Air",
              "Laptop_Apple_MacBook_Pro",
              "Keyboard_Apple_Magic_Keyboard",
              "SmartHomeDevices_Apple_TV",
              "Keyboard_Apple_Wired_Keyboard",
              "Keyboard_Apple_Wireless_Keyboard",
              "ComputerCords_Audio_Cable", 
              "Keyboard_Backlit_LED_Gaming_Keyboard",
              "Accessories_Belkin_Mouse_Pad",
              "Speakers_Bose_Companion_Speakers",
              "Printer_Brother_Printer",
              "PrinterInk_Brother_Printer_Toner",
              "Desktop_CYBERPOWER_Gamer_Desktop",
              "Speakers_Cambridge_Bluetooth_Speaker",
              "PrinterInk_Canon_Ink",
              "Printer_Canon_Office_Printer",
              "Accessories_Computer_Game",
              "Speakers_Cyber_Acoustics",
              "Speakers_DOSS_Touch_Wireless_Bluetooth",
              "Printer_DYMO_Label_Manker",
              "PrinterInk_DYMO_Labeling_Tape",
              "Desktop_Dell_2_Desktop",
              "Desktop_Dell_Desktop",
              "Mouse&KeyboardCombo_Dell_KM117_Wireless_Keyboard_&_Mouse",
              "Laptop_Dell_Laptop",
              "Monitor_Dell_Monitor",
              "Keyboard_Dell_Wired_Keyboard",
              "Mouse&KeyboardCombo_EagleTec_Wireless_Combo_Keyboard_and_Mouse",
              "Laptop_Eluktronics_Pro_Gaming_Laptop",
              "PrinterInk_Epson_Black_Ink",
              "Printer_Epson_Printer",
              "ComputerCords_Etekcity_Power_Extension_Cord_Cable",
              "ComputerCords_Ethernet_Cable",
              "ComputerTablets_Fire_HD_Tablet",
              "SmartHomeDevices_Fire_TV_Stick",
              "ComputerStand_Full_Motion_Monitor_Mount",
              "ComputerMice_Gaming_Mouse_Professional",
              "ComputerMice_Generic_Black_3-Button",
              "SmartHomeDevices_Google_Home",
              "ComputerCords_HDMI_Adapter",
              "ComputerCords_HDMI_Cable_6ft",
              "PrinterInk_HP_Black_&_Tri-color_Ink",
              "Desktop_HP_Desktop",
              "Laptop_HP_Laptop",
              "Monitor_HP_Monitor",
              "Laptop_HP_Notebook_Touchscreen_Laptop_PC",
              "Keyboard_HP_USB_Keyboard",
              "ComputerMice_HP_Wireless_Mouse",
              "Printer_HP_Wireless_Printer",
              "ComputerStand_Halter_Acrylic_Monitor_Stand",
              "ComputerStand_Halter_Mesh_Metal_Monitor_Stand",
              "ComputerStand_Height-Adjustable_Standing_Desk",
              "Desktop_Intel_Desktop",
              "Speakers_JBL_Splashproof_Portable_Bluetooth_Speaker",
              "ComputerHeadphones_Kensington_Headphones",
              "ComputerTablets_Kindle",
              "ComputerHeadphones_Koss_Home_Headphones",
              "Monitor_LG_Monitor",
              "Laptop_LG_Touchscreen_Laptop",
              "Accessories_Large_Mouse_Pad",
              "Desktop_Lenovo_Desktop_Computer",
              "ComputerMice_Logitech_3-button_Mouse",
              "ComputerHeadphones_Logitech_ClearChat_Headset",
              "Mouse&KeyboardCombo_Logitech_Desktop_MK120_Mouse_and_keyboard_Combo",
              "Keyboard_Logitech_Keyboard",
              "Mouse&KeyboardCombo_Logitech_MK270_Wireless_Keyboard_and_Mouse_Combo",
              "Mouse&KeyboardCombo_Logitech_MK360_Wireless_Keyboard_and_Mouse_Combo",
              "Mouse&KeyboardCombo_Logitech_MK550_Wireless_Wave_Keyboard_and_Mouse_Combo",
              "Speakers_Logitech_Multimedia_Speakers",
              "ComputerHeadphones_Logitech_Stereo_Headset",
              "Keyboard_Logitech_Wireless_Keyboard",
              "ComputerMice_Logitech_Wireless_Mouse",
              "Speakers_Mackie_CR_Speakers",
              "ComputerMice_Microsoft_Basic_Optical_Mouse",
              "ComputerHeadphones_Microsoft_Headset",
              "Accessories_Microsoft_Office_Home_and_Student_2016",
              "Mouse&KeyboardCombo_Microsoft_Wireless_Comfort_Keyboard_and_Mouse",
              "Mouse&KeyboardCombo_Microsoft_Wireless_Desktop_Keyboard_and_Mouse",
              "ActiveHeadphones_Monster_Beats_By_Dr_Dre",
              "ComputerStand_Multi_Media_Stand",
              "ActiveHeadphones_Otium_Wireless_Sports_Bluetooth_Headphone",
              "ComputerHeadphones_PC_Gaming_Headset",
              "ActiveHeadphones_Panasonic_In-Ear_Headphone",
              "ComputerHeadphones_Panasonic_On-Ear Stereo_Headphones",
              "ActiveHeadphones_Philips_Flexible_Earhook_Headphone",
              "ComputerMice_Redragon_Gaming_Mouse",
              "Mouse&KeyboardCombo_Rii_LED_Gaming_Keyboard_&_Mouse_Combo",
              "Keyboard_Rii_LED_Keyboard",
              "Speakers_Rokono_Mini_Speaker",
              "SmartHomeDevices_Roku_Express",
              "ComputerCords_Samsung_Charging_Cable",
              "ComputerTablets_Samsung_Galaxy_Tablet",
              "Monitor_Samsung_Monitor",
              "Monitor_Sceptre_Monitor",
              "ExternalHardrives_Slim_2TB_Portable_External_Hard_Drive",
              "ComputerMice_Slim_Wireless_Mouse",
              "SmartHomeDevices_Smart_Light_Bulb",
              "Speakers_Sonos",
              "ComputerCords_USB_Cable",
              "ComputerCords_VGA_Monitor_Cable",
              "Monitor_ViewSonic_Monitor",
              "ComputerMice_Wireless_Portable_Mouse",
              "ComputerHeadphones_XIBERIA_Gaming_Headset",
              "ComputerHeadphones_Zombie_Gaming_Headset",
              "Desktop_iMac",
              "ComputerTablets_iPad",
              "ComputerTablets_iPad_Pro",
              "ComputerCords_iPhone_Charger_Cable")

itemLabels(ElectronTrans)<-myLabels

View(myLabels)

# Create categories # substring (piece of a string), \\_.* 
# everything matching the pattern replace with nothing for all labels
categories<-as.factor(sub("\\_.*", "", myLabels))
categories

# Add Categories #
ElectronTrans@itemInfo$categories<-categories

# Remove empty rows
ElectronTrans<-ElectronTrans[which(size(ElectronTrans)!= 0)]

View(categories)

# 1.3 9833 transactions ####
dim(ElectronTrans)[1]


# 1.4 Visualize Dataset ####
# 17 different product-types
print(levels(itemInfo(ElectronTrans)[["categories"]]))

Elec_ProdTypes<- aggregate(ElectronTrans, itemInfo(ElectronTrans)[["categories"]])

#### Frequency Plot ####
itemFrequencyPlot(Elec_ProdTypes, cex.names=0.8, horiz = TRUE, las =1,
                  col="dark grey", xlab = "Frequency", topN = 16,
                  main = "Product Distribution", type = "relative")

# RColBrewer Package
itemFrequencyPlot(Elec_ProdTypes, type="absolute", topN=17, horiz=FALSE,
                  col = brewer.pal(8,"Pastel2"), xlab="", 
                  main="Product Distribution", ylab = "Category Frequency (absolute)")


image(ElectronTrans[1:5])

image(sample(ElectronTrans, 16))
# Sparse matrix, contains many items 


# 1.5 Apply the Apriori Algorithm ####
apriori(ElectronTrans)

RulesName<- apriori (ElectronTrans, 
                     parameter = list(supp = 0.035, conf = 0.05,
                                      target = "rules", minlen = 1))

RulesName <- sort(RulesName, by = "confidence", decreasing = TRUE)
        
summary(RulesName)

df_rules <- as(RulesName, "data.frame")

View(df_rules)

# 1.6 Model Evaluation & Improvement ####
summary(RulesName)

inspect(RulesName)

inspect(sort(RulesName, by = "lift"))

ItemRules <- subset(RulesName, items %in% "Laptop_HP_Laptop")
                                            
inspect(ItemRules)

plot(ItemRules)

NonRedundantRules <- RulesName[!is.redundant(RulesName)]

inspect(NonRedundantRules)

summary(NonRedundantRules)

# 1.7 Visualise Results ####
plot(NonRedundantRules)

plot(NonRedundantRules, 
                 method="graph", control=list(type="items"), 
                  main = "Association Rules") 

# Grouped Matrix based visualization 
iMac_rules <- subset(RulesName, items %in% "Desktop_iMac")

plot(iMac_rules, 
     method="graph", control=list(type="items"), 
     main = "iMac Rules") 

plot(iMac_rules, method="grouped matrix", measure="support", 
     gp_labels = gpar( cex=0.9))
 



