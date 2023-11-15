download.file(
  "www.worldfloraonline.org/downloadData", destfile = "WorldFlora"
)
install.packages("WorldFlora")
getOption('timeout')
options(timeout = 1500)

library(WorldFlora)


WFO.data
WFO.download(WFO.url =
               paste0("https://files.worldfloraonline.org/files/WFO_Backbone/",
                      "_WFOCompleteBackbone/WFO_Backbone.zip"),
             save.dir = getwd(), WFO.remember = TRUE,
             timeout = 1500)
WFO.remember(WFO.file = NULL, WFO.data = "WFO.data", WFO.pos = 1)

library(writexl)
#write.csv(WFO.data,"C:/Users/USER/Downloads/WFO_DuplicatesWAuth.csv", row.names = FALSE)

false <- read.csv("C:/Users/USER/Downloads/WFO_DuplicatesWAuth.csv")

false

write.csv(WFO.match(false$ScientificName, WFO.data=WFO.data), "C:/Users/USER/Downloads/NCBI_False_Match_Duplicates.csv", row.names = FALSE)
