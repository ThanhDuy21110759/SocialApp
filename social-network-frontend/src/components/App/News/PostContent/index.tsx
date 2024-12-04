import { Typography } from "@mui/material";
import SlideShow from "./SlideShow";
import { PostContentStyles } from "./styles";

interface PostContentProps {
  messages: string[];
  images: string[];
}

const PostContent: React.FC<PostContentProps> = ({ messages, images }) => {
  return (
    <PostContentStyles>
      {messages.map((message, index) => (
        <Typography key={index} sx={{ fontSize: "15px", marginBottom: 1 }}>
          {message}
        </Typography>
      ))}
      {images.length > 0 && <SlideShow images={images} />}
    </PostContentStyles>
  );
};
export default PostContent;
