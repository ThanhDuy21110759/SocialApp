import { Box } from "@mui/material";
import { HeaderNotification } from "../../components/App/Header/Header";
import Navbar from "../../components/App/Navbar/Navbar";
import Profile from "../Profile/index";

const ProfilePage = () => {
  return (
    <>
      <HeaderNotification number={3} />
      <Box sx={{ padding: "0px 50px" }}>
        <Navbar />
        <Profile />
      </Box>
    </>
  );
};
export default ProfilePage;
