require(dplyr)
require(ggplot2)
setwd("C:\\Users\\mburt\\Downloads")


#################################################################################################################################

filename <- "20200302_112946 Injector accuracy test 50_ CO2 120ul per sec.xlsx"
CO2_Water_120_OD998 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B63:M71", progress = readxl::readxl_progress())
CO2_Water_120_OD900 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B75:M83", progress = readxl::readxl_progress())

CO2_120 <- CO2_Water_120_OD998 - CO2_Water_120_OD900
rm(CO2_Water_120_OD998, CO2_Water_120_OD900)

col_plot <- reshape2::melt(CO2_120)
rid <- rep.int(1:8, times = 12)
row_plot <- cbind(col_plot, rid)
rm(col_plot, rid)

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = rid, y =value, group = rid)) + 
  xlab("Row Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("CO2 120 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = variable, y =value, group = variable)) + 
  xlab("Column Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("CO2 120 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

rm(row_plot)
#################################################################################################################################

filename <- "20200302_113517 Injector accuracy test 50_ CO2 200ul per sec.xlsx"
CO2_Water_200_OD998 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B63:M71", progress = readxl::readxl_progress())
CO2_Water_200_OD900 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B75:M83", progress = readxl::readxl_progress())

CO2_200 <- CO2_Water_200_OD998 - CO2_Water_200_OD900
rm(CO2_Water_200_OD998,CO2_Water_200_OD900)

col_plot <- reshape2::melt(CO2_200)
rid <- rep.int(1:8, times = 12)
row_plot <- cbind(col_plot, rid)
rm(col_plot, rid)

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = rid, y =value, group = rid)) + 
  xlab("Row Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("CO2 200 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = variable, y =value, group = variable)) + 
  xlab("Column Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("CO2 200 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

rm(row_plot)
#################################################################################################################################

filename <- "20200302_114112 Injector accuracy test 50_ CO2 300ul per sec.xlsx"
CO2_Water_300_OD998 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B63:M71", progress = readxl::readxl_progress())
CO2_Water_300_OD900 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B75:M83", progress = readxl::readxl_progress())

CO2_300 <- CO2_Water_300_OD998 - CO2_Water_300_OD900
rm(CO2_Water_300_OD998,CO2_Water_300_OD900)

col_plot <- reshape2::melt(CO2_300)
rid <- rep.int(1:8, times = 12)
row_plot <- cbind(col_plot, rid)
rm(col_plot, rid)

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = rid, y =value, group = rid)) + 
  xlab("Row Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("CO2 300 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = variable, y =value, group = variable)) + 
  xlab("Column Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("CO2 300 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

rm(row_plot)
#################################################################################################################################

filename <- "20200302_105152 Injector accuracy test DI water 120ul per sec.xlsx"
DI_Water_120_OD998 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B63:M71", progress = readxl::readxl_progress())
DI_Water_120_OD900 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B75:M83", progress = readxl::readxl_progress())

DI_120 <- DI_Water_120_OD998 - DI_Water_120_OD900
rm(DI_Water_120_OD998,DI_Water_120_OD900)

col_plot <- reshape2::melt(DI_120)
rid <- rep.int(1:8, times = 12)
row_plot <- cbind(col_plot, rid)
rm(col_plot, rid)

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = rid, y =value, group = rid)) + 
  xlab("Row Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("DI Water 120 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = variable, y =value, group = variable)) + 
  xlab("Column Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("DI Water 120 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

rm(row_plot)
#################################################################################################################################

filename <- "20200302_105909 Injector accuracy test DI water 200ul per sec.xlsx"
DI_Water_200_OD998 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B63:M71", progress = readxl::readxl_progress())
DI_Water_200_OD900 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B75:M83", progress = readxl::readxl_progress())

DI_200 <- DI_Water_200_OD998 - DI_Water_200_OD900
rm(DI_Water_200_OD998, DI_Water_200_OD900)

col_plot <- reshape2::melt(DI_200)
rid <- rep.int(1:8, times = 12)
row_plot <- cbind(col_plot, rid)
rm(col_plot, rid)

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = rid, y =value, group = rid)) + 
  xlab("Row Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("DI Water 200 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = variable, y =value, group = variable)) + 
  xlab("Column Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("DI Water 200 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

rm(row_plot)
#################################################################################################################################

filename <- "20200302_110441 Injector accuracy test DI water 300ul per sec.xlsx"
DI_Water_300_OD998 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B63:M71", progress = readxl::readxl_progress())
DI_Water_300_OD900 <- readxl::read_xlsx(filename, col_names = TRUE, range = "B75:M83", progress = readxl::readxl_progress())

DI_300 <- DI_Water_300_OD998 - DI_Water_300_OD900
rm(DI_Water_300_OD998, DI_Water_300_OD900)

col_plot <- reshape2::melt(DI_300)
rid <- rep.int(1:8, times = 12)
row_plot <- cbind(col_plot, rid)
rm(col_plot, rid)

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = rid, y =value, group = rid)) + 
  xlab("Row Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("DI Water 300 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

ggplot(data = row_plot) + 
  geom_boxplot(aes(x = variable, y =value, group = variable)) + 
  xlab("Column Id") +
  ylab("O.D. 998 - O.D. 900") + 
  ggtitle("DI Water 300 microliters") +
  scale_y_continuous(limits = c(.03, .08)) +
  theme_bw()

rm(row_plot)