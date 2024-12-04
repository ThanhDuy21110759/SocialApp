import { Box, ListItemButton, Typography } from "@mui/material";
import SettingsIcon from "@mui/icons-material/Settings";
import EmailIcon from "@mui/icons-material/Email";
import ArrowDropDownIcon from "@mui/icons-material/ArrowDropDown";
import ArrowDropUpIcon from "@mui/icons-material/ArrowDropUp";
import DashboardIcon from "@mui/icons-material/Dashboard";
import FeedIcon from "@mui/icons-material/Feed";
import ManageAccountsIcon from "@mui/icons-material/ManageAccounts";
import CircleNotificationsIcon from "@mui/icons-material/CircleNotifications";
import AttachFileIcon from "@mui/icons-material/AttachFile";
import DonutSmallIcon from "@mui/icons-material/DonutSmall";

import {
  ChildrenPageMenuItem,
  PageMenuItem,
} from "../../../store/reducers/sidebar.reducer";
import { useDispatch, useSelector } from "react-redux";
import { sidebarStore } from "../../../store/reducers";
import { useTranslation } from "react-i18next";
import React from "react";
import Logo from "../Common/Logo/Logo";

const navIconStyle = {
  width: 18,
  height: 24,
};

export const menuIconList = {
  dashboardIcon: <DashboardIcon sx={navIconStyle} />,
  feedIcon: <FeedIcon sx={navIconStyle} />,
  manageAccountsIcon: <ManageAccountsIcon sx={navIconStyle} />,
  circleNotificationsIcon: <CircleNotificationsIcon sx={navIconStyle} />,
  attachFileIcon: <AttachFileIcon sx={navIconStyle} />,
  donutSmallIcon: <DonutSmallIcon sx={navIconStyle} />,
  settingsIcon: <SettingsIcon sx={navIconStyle} />,
  emailIcon: <EmailIcon sx={navIconStyle} />,
};

const menuItemColor = {
  selected: "black",
  unselected: "#707a89",
};

interface SideBarv2Props {
  open: boolean;
  userInformation: any;
  onClick: (pageName: string) => void;
}

const SideBarv2: React.FC<SideBarv2Props> = ({
  open,
  userInformation,
  onClick,
}) => {
  const selectedItem = useSelector(sidebarStore.getSelectedMenuItem);
  const mainMenuItemList = useSelector(sidebarStore.selectMainMenuItemList);
  const dispatch = useDispatch();
  const { t } = useTranslation();

  const handleOnClickPageMenuItem = (
    item: PageMenuItem | ChildrenPageMenuItem
  ) => {
    if (!open || item.name === selectedItem.name) return;
    if ("childrenPages" in item && item.childrenPages) {
      dispatch(sidebarStore.actions.toggleMenuItem(item.name));
    } else {
      dispatch(sidebarStore.actions.setSelectedItem(item));
      // change page not navigate
      console.log("item.name", item.name);
      onClick(item.name);
    }
  };

  const getDropDownIcon = (isOpen: boolean) =>
    isOpen ? (
      <ArrowDropDownIcon sx={{ height: "24px" }} />
    ) : (
      <ArrowDropUpIcon sx={{ height: "24px" }} />
    );

  const checkParentItemHasSelectedChildItem = (parentItem: PageMenuItem) => {
    return (
      parentItem.childrenPages?.some(
        (child) => child.name === selectedItem.name
      ) || false
    );
  };

  const renderChildrenPages = (menuItem: PageMenuItem) => {
    const navBar = menuItem.childrenPages
      ? menuItem.childrenPages.map((childItem, index) => {
          const isSelected = childItem.name === selectedItem.name;
          const itemColor = isSelected
            ? menuItemColor.selected
            : menuItemColor.unselected;
          return (
            open && (
              <ListItemButton
                key={index}
                sx={{
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "flex-start",
                  "& .MuiSvgIcon-root": {
                    fill: itemColor,
                  },
                  ...(isSelected && {
                    "&::before": {
                      content: '""',
                      display: "block",
                      width: "4px",
                      height: "100%",
                      backgroundColor: itemColor,
                      position: "absolute",
                      left: "0px",
                    },
                  }),
                }}
                onClick={() => handleOnClickPageMenuItem(childItem)}
              >
                <div style={navIconStyle}></div>
                <Typography
                  sx={{
                    fontSize: 14,
                    marginLeft: 2,
                    width: "100%",
                    color: itemColor,
                    textWrap: "nowrap",
                  }}
                >
                  {t(childItem.name)}
                </Typography>
              </ListItemButton>
            )
          );
        })
      : null;
    return navBar;
  };

  const renderMainMenu = (menuItemList: PageMenuItem[]) =>
    menuItemList.map((item, index) => {
      const isSelected = item.name === selectedItem.name;
      const hasChildSelectedItem =
        item.childrenPages && checkParentItemHasSelectedChildItem(item);
      const itemColor =
        isSelected || hasChildSelectedItem
          ? menuItemColor.selected
          : menuItemColor.unselected;

      return (
        <React.Fragment key={index}>
          <ListItemButton
            sx={{
              display: "flex",
              alignItems: "center",
              justifyContent: open ? "flex-start" : "center",
              "& .MuiSvgIcon-root": { fill: itemColor },
              position: "relative",
              ...((isSelected || hasChildSelectedItem) && {
                "&::before": {
                  content: '""',
                  display: "block",
                  width: "4px",
                  height: "100%",
                  backgroundColor: itemColor,
                  position: "absolute",
                  left: "0px",
                },
              }),
            }}
            onClick={() => handleOnClickPageMenuItem(item)}
          >
            {menuIconList[item.icon]}
            {open && (
              <Typography
                sx={{
                  fontSize: 15,
                  marginLeft: 2,
                  width: "100%",
                  color: itemColor,
                  display: "flex",
                  justifyContent: "space-between",
                  fontWeight: 500,
                }}
              >
                {t(item.name)}
                {item.childrenPages && getDropDownIcon(item.isOpen)}
              </Typography>
            )}
          </ListItemButton>

          {item.childrenPages && item.isOpen && renderChildrenPages(item)}
        </React.Fragment>
      );
    });

  return (
    <>
      <Box sx={{ flex: 1, height: 0, width: "18%" }}>
        <Box
          sx={{
            display: "flex",
            justifyContent: "center",
            alignContent: "center",
          }}
        >
          <Logo img="/static/logo/sentry-full.svg">Logo</Logo>
        </Box>
        <Box
          sx={{
            display: "flex",
            flexDirection: "column",
            alignItems: "left",
            justifyContent: "space-between",
            height: "100%",
            zIndex: (theme) => theme.zIndex.drawer + 100,
          }}
        >
          {renderMainMenu(mainMenuItemList)}
        </Box>
      </Box>
      {/*  */}
    </>
  );
};

export default SideBarv2;
