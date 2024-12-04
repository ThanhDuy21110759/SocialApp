import CallRoundedIcon from "@mui/icons-material/CallRounded";
import CircleIcon from "@mui/icons-material/Circle";
import MicRoundedIcon from "@mui/icons-material/MicRounded";
import VideoCallRoundedIcon from "@mui/icons-material/VideoCallRounded";
import { parseCookies } from "nookies";
import { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { chatStore } from "../../../../store/reducers";
import {
  ChatAreaStyle,
  ChatInputStyle,
  DisplayChatStyle,
  HeadingStyle,
  UserHeadingStyle,
} from "./styles";

import { selectSelectedUserUUID } from "../../../../store/reducers/user.reducer";
import LineChat from "../LineChat";

import SendIcon from "@mui/icons-material/Send";
import {
  Avatar,
  Box,
  Button,
  FormControl,
  OutlinedInput,
  Typography,
} from "@mui/material";

import { Client, Stomp } from "@stomp/stompjs";
import SockJS from "sockjs-client";
import { SOCKET_URL } from "../../../../Path/backend";
import { ChatResponse } from "../../../../store/reducers/chat.reducer";
import { useTranslation } from "react-i18next";

const ChatArea: React.FC = () => {
  const { t } = useTranslation();
  const [historyMessage, setHistoryMessage] = useState<ChatResponse | null>();
  const [newMessage, setNewMessage] = useState("");
  const [stompClient, setStompClient] = useState<Client | null>(null);
  const chatRef = useRef<HTMLDivElement | null>(null);
  const dispatch = useDispatch();
  const chatList = useSelector(chatStore.selectChatList);

  const selectedUserUUID: {
    online: boolean;
    uuid: string;
    username: string;
    avatar: string;
  } | null = useSelector(selectSelectedUserUUID);
  const cookies = parseCookies();
  let uuid = cookies["uuid"];
  const getChat = async () => {
    if (selectedUserUUID !== null) {
      dispatch(
        chatStore.sagaGetList({
          senderUUID: uuid,
          receiverUUID: selectedUserUUID.uuid,
        })
      );
      setHistoryMessage(chatList);
    }
  };

  useEffect(() => {
    if (chatRef.current) {
      chatRef.current.scrollTo({
        top: chatRef.current.scrollHeight,
        behavior: "smooth",
      });
    }
  }, [historyMessage]);
  useEffect(() => {
    setHistoryMessage(chatList);
  }, [chatList]);

  useEffect(() => {
    getChat();
    const socket = new SockJS(SOCKET_URL);
    const stompClient = Stomp.over(socket);

    // Function to handle successful connection
    const onConnect = () => {
      console.log("Connected to WebSocket successfully.");
      stompClient.subscribe(
        `/user/${uuid}/queue/messages/${selectedUserUUID?.uuid}`,
        (message) => {
          const chatMessage = JSON.parse(message.body);
          setHistoryMessage(chatMessage);
        }
      );
    };

    // Connect with error handling
    stompClient.connect({}, onConnect);
    setStompClient(stompClient);
    return () => {
      if (stompClient) {
        stompClient.deactivate();
      }
    };
  }, [selectedUserUUID]);

  const sendMessage = async () => {
    if (stompClient && newMessage.trim() && selectedUserUUID) {
      const chatMessage = {
        senderUUID: { uuid: uuid }, // Create a User object for sender
        receiverUUID: { uuid: selectedUserUUID.uuid }, // Create a User object for receiver
        threads: [
          {
            senderUUID: uuid,
            content: {
              message: newMessage, // Actual message text
              timeStamps: new Date().toISOString,
            },
            lastUploadedAt: new Date().toISOString,
          },
        ],
      };
      try {
        stompClient.publish({
          destination: "/app/chat",
          body: JSON.stringify(chatMessage),
        });
      } catch (error) {
        console.error("Failed to send message:", error);
      }
      setNewMessage("");
      getChat();
    } else {
      console.error("STOMP client is not connected.");
    }
  };
  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setNewMessage(event.target.value); // Set the new message
  };
  const handleKeyDown = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === "Enter") {
      sendMessage();
    }
  };
  return (
    <ChatAreaStyle>
      <HeadingStyle>
        {selectedUserUUID !== null ? (
          <UserHeadingStyle>
            <Avatar src={selectedUserUUID.avatar} alt="photoURL" />
            {selectedUserUUID.online === true ? (
              <CircleIcon
                sx={{
                  fontSize: 12,
                  color: "#4caf50",
                  position: "absolute",
                  marginLeft: 3,
                  marginTop: 4,
                }}
              />
            ) : null}

            <Typography
              variant="subtitle1"
              style={{ margin: "0px 10px", color: "black", fontSize: "20px" }}
            >
              {selectedUserUUID?.username}
            </Typography>
            <Box
              sx={{
                marginRight: 0,
                marginLeft: "auto",
              }}
            >
              <CallRoundedIcon
                sx={{
                  color: "black",
                  marginRight: 2,
                  fontSize: "30px",
                }}
              />
              <VideoCallRoundedIcon
                sx={{
                  color: "black",
                  fontSize: "30px",
                }}
              />
            </Box>
          </UserHeadingStyle>
        ) : null}
      </HeadingStyle>

      <DisplayChatStyle ref={chatRef}>
        {historyMessage !== null
          ? historyMessage?.threads
              // .slice()
              // .reverse()
              .map((thread, index) => (
                <LineChat
                  key={index}
                  message={thread.content?.message || ""}
                  senderUUID={thread.senderUUID}
                  timestamps={thread?.timeStamps}
                />
              ))
          : null}
      </DisplayChatStyle>
      <ChatInputStyle>
        <MicRoundedIcon
          sx={{
            color: "black",
            marginRight: 0,
            marginLeft: "auto",
            fontSize: "30px",
          }}
        />
        <FormControl fullWidth sx={{ m: 1 }}>
          <OutlinedInput
            value={newMessage}
            onChange={handleInputChange}
            onKeyDown={handleKeyDown}
            placeholder={t("chat.typeMessage")}
          />
        </FormControl>
        <Button
          onClick={sendMessage}
          variant="contained"
          endIcon={<SendIcon />}
        >
          {t("chat.send")}
        </Button>
      </ChatInputStyle>
    </ChatAreaStyle>
  );
};

export default ChatArea;
