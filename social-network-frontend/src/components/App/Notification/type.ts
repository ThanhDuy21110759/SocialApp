export type NotificationType = {
  uuid: string;
  title: string;
  message: string;
  imagesUrl: string | null;
  type:
    | "order_placed"
    | "friend_interactive"
    | "chat_message"
    | "mail"
    | "order_shipped"
    | "friend_request"
    | "profile_update"
    | "order_delivered"
    | "system_alert"
    | "promotion"
    | "payment";
  createdAt: Date;
  unread: boolean;
};
