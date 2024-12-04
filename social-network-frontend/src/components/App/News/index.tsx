import { Box, Button, SxProps } from "@mui/material";
import PostHeader from "./PostHeader";
import { styled } from "@mui/material/styles";
import PostContent from "./PostContent";
import PostReaction from "./PostReaction";
import PostFooter from "./PostFooter";
import PostComments from "./PostComment";
import { useDispatch, useSelector } from "react-redux";
import { dialogStore, postStore, reactionStore } from "../../../store/reducers";
import { useEffect, useState } from "react";
import {
  fToConvertStringToListString,
  fToConvertObjImgsToListStringURL,
} from "../../../utils/formatString";

export const Post = styled(Box)`
  border-radius: 10px;
  background-color: #fff;
  margin-bottom: 10px;
`;

export default function News({ sx }: { sx?: SxProps }) {
  const dispatch = useDispatch();
  const listPost = useSelector(postStore.selectPosts);
  const displayDetailPost = useSelector(dialogStore.selectDisplayDetailPost);

  // pagination
  const [page, setPage] = useState(1);
  const size = 3;

  useEffect(() => {
    dispatch(postStore.TSagaGetPosts(page, size));
  }, [dispatch]);

  //loading
  const [loading, setLoading] = useState(false);

  const loadMorePosts = async () => {
    setLoading(true);
    await dispatch(postStore.TSagaGetPosts(page + 1, size));
    setPage((prevPage) => prevPage + 1);
    setLoading(false);
  };

  return (
    <>
      {listPost.map((post) => (
        <Post
          key={post.uuid}
          sx={{ padding: "5px", border: "1px solid #e0e0e0", ...sx }}
        >
          {/* header for owner user */}
          <PostHeader
            username={post.user?.username}
            lastUpdateAt={post.createdDateAt}
            status={post.status}
            uuid={post.user.uuid}
          />
          <PostContent
            messages={fToConvertStringToListString(post.content.message)}
            images={fToConvertObjImgsToListStringURL(post.content.imageURLs)}
          />
          <PostReaction post={post} />
          <PostFooter post={post} />
          {displayDetailPost && (
            <PostComments
              user={post.user}
              status={post.status}
              content={post.content}
              comments={post.comments}
              reactions={post.reactions}
              createdDateAt={post.createdDateAt}
              uuid={post.uuid}
            />
          )}{" "}
        </Post>
      ))}
      <Button
        onClick={loadMorePosts}
        variant="contained"
        color="primary"
        disabled={loading}
        sx={{ margin: "10px 0px" }}
        fullWidth
      >
        {loading ? "Loading..." : "Load More"}
      </Button>
    </>
  );
}
