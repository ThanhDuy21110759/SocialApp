PGDMP       .            
    |            SocialMedia    16.3    16.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    43519    SocialMedia    DATABASE     �   CREATE DATABASE "SocialMedia" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "SocialMedia";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    114614    address    TABLE     	  CREATE TABLE public.address (
    id integer NOT NULL,
    city character varying(255),
    country character varying(255),
    state character varying(255),
    street character varying(255),
    zip character varying(255),
    user_uuid character varying(255)
);
    DROP TABLE public.address;
       public         heap    postgres    false    4            �            1259    72035    address_seq    SEQUENCE     u   CREATE SEQUENCE public.address_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.address_seq;
       public          postgres    false    4            �            1259    114621    chat_message    TABLE     �   CREATE TABLE public.chat_message (
    uuid character varying(255) NOT NULL,
    last_uploaded_at timestamp(6) without time zone,
    receiver_uuid character varying(255),
    sender_uuid character varying(255)
);
     DROP TABLE public.chat_message;
       public         heap    postgres    false    4            �            1259    114628    comment    TABLE     Q  CREATE TABLE public.comment (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    created_by character varying(255),
    content_uuid character varying(255),
    post_uuid character varying(255)
);
    DROP TABLE public.comment;
       public         heap    postgres    false    4            �            1259    114635    content    TABLE     :  CREATE TABLE public.content (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    message text,
    created_by character varying(255),
    file_uuid character varying(255)
);
    DROP TABLE public.content;
       public         heap    postgres    false    4            �            1259    114604    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 %   DROP TABLE public.databasechangelog;
       public         heap    postgres    false    4            �            1259    114609    databasechangeloglock    TABLE     �   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap    postgres    false    4            �            1259    114642    follow    TABLE     �  CREATE TABLE public.follow (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    is_blocked boolean,
    is_muted boolean,
    created_by character varying(255),
    follower_uuid character varying(255) NOT NULL,
    following_uuid character varying(255) NOT NULL
);
    DROP TABLE public.follow;
       public         heap    postgres    false    4            �            1259    114649    friend    TABLE     �  CREATE TABLE public.friend (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    is_active boolean NOT NULL,
    created_by character varying(255),
    friend_uuid character varying(255) NOT NULL,
    user_uuid character varying(255) NOT NULL
);
    DROP TABLE public.friend;
       public         heap    postgres    false    4            �            1259    114656    friend_request    TABLE     U  CREATE TABLE public.friend_request (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    status character varying(255) NOT NULL,
    created_by character varying(255),
    receiver_uuid character varying(255) NOT NULL,
    requester_uuid character varying(255) NOT NULL,
    CONSTRAINT friend_request_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACCEPTED'::character varying, 'REJECTED'::character varying])::text[])))
);
 "   DROP TABLE public.friend_request;
       public         heap    postgres    false    4            �            1259    114664    images    TABLE     w  CREATE TABLE public.images (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    name_image character varying(255),
    url_image character varying(255),
    created_by character varying(255),
    content_uuid character varying(255)
);
    DROP TABLE public.images;
       public         heap    postgres    false    4            �            1259    114672    import_failure    TABLE     �   CREATE TABLE public.import_failure (
    id integer NOT NULL,
    file_uuid character varying(255),
    primary_key character varying(255),
    reason_key character varying(255),
    reason_value character varying(255),
    type character varying(255)
);
 "   DROP TABLE public.import_failure;
       public         heap    postgres    false    4            �            1259    114671    import_failure_id_seq    SEQUENCE     �   ALTER TABLE public.import_failure ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.import_failure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233    4            �            1259    54325    import_failure_seq    SEQUENCE     |   CREATE SEQUENCE public.import_failure_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.import_failure_seq;
       public          postgres    false    4            �            1259    114679    media_resources    TABLE     �  CREATE TABLE public.media_resources (
    file_uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    is_external boolean,
    file_description character varying(255),
    file_name character varying(255),
    file_path character varying(255),
    file_size bigint,
    file_thumbnail character varying(255),
    file_type character varying(255),
    is_success boolean,
    created_by character varying(255),
    CONSTRAINT media_resources_file_type_check CHECK (((file_type)::text = ANY ((ARRAY['PNG'::character varying, 'JPG'::character varying, 'MP4'::character varying, 'MP3'::character varying, 'PDF'::character varying, 'DOCX'::character varying, 'XLSX'::character varying, 'TXT'::character varying, 'ZIP'::character varying, 'RAR'::character varying])::text[])))
);
 #   DROP TABLE public.media_resources;
       public         heap    postgres    false    4            �            1259    114687    notification    TABLE     �  CREATE TABLE public.notification (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    images_url character varying(255),
    message character varying(255),
    status smallint,
    title character varying(255),
    type character varying(255),
    unread boolean,
    receiver_uuid character varying(255),
    sender_uuid character varying(255),
    CONSTRAINT notification_status_check CHECK (((status >= 0) AND (status <= 6))),
    CONSTRAINT notification_type_check CHECK (((type)::text = ANY ((ARRAY['ORDER_PLACED'::character varying, 'FRIEND_INTERACTIVE'::character varying, 'CHAT_MESSAGE'::character varying, 'MAIL'::character varying, 'ORDER_SHIPPED'::character varying, 'FRIEND_REQUEST'::character varying, 'PROFILE_UPDATE'::character varying, 'ORDER_DELIVERED'::character varying, 'SYSTEM_ALERT'::character varying, 'PROMOTION'::character varying, 'PAYMENT'::character varying])::text[])))
);
     DROP TABLE public.notification;
       public         heap    postgres    false    4            �            1259    114696    post    TABLE     �  CREATE TABLE public.post (
    uuid character varying(255) NOT NULL,
    created_date_at timestamp(6) without time zone,
    status character varying(255),
    content_uuid character varying(255),
    folder_uuid character varying(255),
    user_uuid character varying(255),
    CONSTRAINT post_status_check CHECK (((status)::text = ANY ((ARRAY['PUBLIC'::character varying, 'PRIVATE'::character varying, 'FRIENDS'::character varying])::text[])))
);
    DROP TABLE public.post;
       public         heap    postgres    false    4            �            1259    114704    post_folder    TABLE     0  CREATE TABLE public.post_folder (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    name character varying(255) NOT NULL,
    created_by character varying(255)
);
    DROP TABLE public.post_folder;
       public         heap    postgres    false    4            �            1259    114711    profile    TABLE     �  CREATE TABLE public.profile (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    avatar character varying(255),
    bio character varying(255),
    date_of_birth character varying(255),
    first_name character varying(255),
    gender character varying(255),
    is_online boolean,
    last_name character varying(255),
    middle_name character varying(255),
    phone_number character varying(255),
    created_by character varying(255),
    CONSTRAINT profile_gender_check CHECK (((gender)::text = ANY ((ARRAY['MALE'::character varying, 'FEMALE'::character varying])::text[])))
);
    DROP TABLE public.profile;
       public         heap    postgres    false    4            �            1259    72036    profile_seq    SEQUENCE     u   CREATE SEQUENCE public.profile_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.profile_seq;
       public          postgres    false    4            �            1259    114719    reaction    TABLE     Y  CREATE TABLE public.reaction (
    uuid character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    last_modified_by character varying(255),
    last_modified_at timestamp(6) without time zone,
    reaction_type character varying(255),
    created_by character varying(255),
    post_uuid character varying(255),
    CONSTRAINT reaction_reaction_type_check CHECK (((reaction_type)::text = ANY ((ARRAY['LIKE'::character varying, 'HAHA'::character varying, 'WOW'::character varying, 'SAD'::character varying, 'ANGRY'::character varying, 'LOVE'::character varying])::text[])))
);
    DROP TABLE public.reaction;
       public         heap    postgres    false    4            �            1259    72037    reaction_count_seq    SEQUENCE     |   CREATE SEQUENCE public.reaction_count_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.reaction_count_seq;
       public          postgres    false    4            �            1259    114727    refreshtoken    TABLE     �   CREATE TABLE public.refreshtoken (
    id bigint NOT NULL,
    expiry_date timestamp(6) with time zone NOT NULL,
    token character varying(255) NOT NULL,
    user_uuid character varying(255)
);
     DROP TABLE public.refreshtoken;
       public         heap    postgres    false    4            �            1259    72038    refreshtoken_seq    SEQUENCE     z   CREATE SEQUENCE public.refreshtoken_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.refreshtoken_seq;
       public          postgres    false    4            �            1259    114734    role    TABLE        CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(255),
    CONSTRAINT role_role_name_check CHECK (((role_name)::text = ANY ((ARRAY['ROLE_USER'::character varying, 'ROLE_ADMIN'::character varying, 'ROLE_MODERATOR'::character varying])::text[])))
);
    DROP TABLE public.role;
       public         heap    postgres    false    4            �            1259    72039    role_seq    SEQUENCE     r   CREATE SEQUENCE public.role_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.role_seq;
       public          postgres    false    4            �            1259    114740    thread    TABLE     �   CREATE TABLE public.thread (
    uuid character varying(255) NOT NULL,
    senderuuid character varying(255),
    time_stamps timestamp(6) without time zone,
    chat_message_uuid character varying(255),
    content_uuid character varying(255)
);
    DROP TABLE public.thread;
       public         heap    postgres    false    4            �            1259    114747    user    TABLE     �  CREATE TABLE public."user" (
    uuid character varying(255) NOT NULL,
    default_locale character varying(255),
    email character varying(255),
    is_active boolean,
    last_login_at timestamp(6) without time zone,
    last_updated_at timestamp(6) without time zone,
    password character varying(255),
    register_date_at timestamp(6) without time zone,
    user_name character varying(255)
);
    DROP TABLE public."user";
       public         heap    postgres    false    4            �            1259    114754 
   user_roles    TABLE     p   CREATE TABLE public.user_roles (
    user_uuid character varying(255) NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false    4            �            1259    44211    user_seq    SEQUENCE     r   CREATE SEQUENCE public.user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.user_seq;
       public          postgres    false    4            �          0    114614    address 
   TABLE DATA           S   COPY public.address (id, city, country, state, street, zip, user_uuid) FROM stdin;
    public          postgres    false    224   �       �          0    114621    chat_message 
   TABLE DATA           Z   COPY public.chat_message (uuid, last_uploaded_at, receiver_uuid, sender_uuid) FROM stdin;
    public          postgres    false    225   	�       �          0    114628    comment 
   TABLE DATA           |   COPY public.comment (uuid, created_at, last_modified_by, last_modified_at, created_by, content_uuid, post_uuid) FROM stdin;
    public          postgres    false    226   &�       �          0    114635    content 
   TABLE DATA           w   COPY public.content (uuid, created_at, last_modified_by, last_modified_at, message, created_by, file_uuid) FROM stdin;
    public          postgres    false    227   w�       �          0    114604    databasechangelog 
   TABLE DATA           �   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          postgres    false    222   ޽       �          0    114609    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          postgres    false    223   ��       �          0    114642    follow 
   TABLE DATA           �   COPY public.follow (uuid, created_at, last_modified_by, last_modified_at, is_blocked, is_muted, created_by, follower_uuid, following_uuid) FROM stdin;
    public          postgres    false    228   ��       �          0    114649    friend 
   TABLE DATA           �   COPY public.friend (uuid, created_at, last_modified_by, last_modified_at, is_active, created_by, friend_uuid, user_uuid) FROM stdin;
    public          postgres    false    229   M�       �          0    114656    friend_request 
   TABLE DATA           �   COPY public.friend_request (uuid, created_at, last_modified_by, last_modified_at, status, created_by, receiver_uuid, requester_uuid) FROM stdin;
    public          postgres    false    230   ^�       �          0    114664    images 
   TABLE DATA           �   COPY public.images (uuid, created_at, last_modified_by, last_modified_at, name_image, url_image, created_by, content_uuid) FROM stdin;
    public          postgres    false    231   @�       �          0    114672    import_failure 
   TABLE DATA           d   COPY public.import_failure (id, file_uuid, primary_key, reason_key, reason_value, type) FROM stdin;
    public          postgres    false    233   7�       �          0    114679    media_resources 
   TABLE DATA           �   COPY public.media_resources (file_uuid, created_at, last_modified_by, last_modified_at, is_external, file_description, file_name, file_path, file_size, file_thumbnail, file_type, is_success, created_by) FROM stdin;
    public          postgres    false    234   T�       �          0    114687    notification 
   TABLE DATA           �   COPY public.notification (uuid, created_at, images_url, message, status, title, type, unread, receiver_uuid, sender_uuid) FROM stdin;
    public          postgres    false    235   q�       �          0    114696    post 
   TABLE DATA           c   COPY public.post (uuid, created_date_at, status, content_uuid, folder_uuid, user_uuid) FROM stdin;
    public          postgres    false    236   �       �          0    114704    post_folder 
   TABLE DATA           m   COPY public.post_folder (uuid, created_at, last_modified_by, last_modified_at, name, created_by) FROM stdin;
    public          postgres    false    237   '�       �          0    114711    profile 
   TABLE DATA           �   COPY public.profile (id, created_at, last_modified_by, last_modified_at, avatar, bio, date_of_birth, first_name, gender, is_online, last_name, middle_name, phone_number, created_by) FROM stdin;
    public          postgres    false    238   ��       �          0    114719    reaction 
   TABLE DATA           ~   COPY public.reaction (uuid, created_at, last_modified_by, last_modified_at, reaction_type, created_by, post_uuid) FROM stdin;
    public          postgres    false    239   ��       �          0    114727    refreshtoken 
   TABLE DATA           I   COPY public.refreshtoken (id, expiry_date, token, user_uuid) FROM stdin;
    public          postgres    false    240   v�       �          0    114734    role 
   TABLE DATA           2   COPY public.role (role_id, role_name) FROM stdin;
    public          postgres    false    241   ��       �          0    114740    thread 
   TABLE DATA           `   COPY public.thread (uuid, senderuuid, time_stamps, chat_message_uuid, content_uuid) FROM stdin;
    public          postgres    false    242   ��       �          0    114747    user 
   TABLE DATA           �   COPY public."user" (uuid, default_locale, email, is_active, last_login_at, last_updated_at, password, register_date_at, user_name) FROM stdin;
    public          postgres    false    243   ��       �          0    114754 
   user_roles 
   TABLE DATA           8   COPY public.user_roles (user_uuid, role_id) FROM stdin;
    public          postgres    false    244   ��       �           0    0    address_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.address_seq', 1, false);
          public          postgres    false    217            �           0    0    import_failure_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.import_failure_id_seq', 1, false);
          public          postgres    false    232            �           0    0    import_failure_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.import_failure_seq', 1, false);
          public          postgres    false    216            �           0    0    profile_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.profile_seq', 851, true);
          public          postgres    false    218            �           0    0    reaction_count_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reaction_count_seq', 1, false);
          public          postgres    false    219            �           0    0    refreshtoken_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.refreshtoken_seq', 851, true);
          public          postgres    false    220            �           0    0    role_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.role_seq', 1, false);
          public          postgres    false    221            �           0    0    user_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.user_seq', 1, false);
          public          postgres    false    215            �           2606    114620    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    224            �           2606    114627    chat_message chat_message_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_pkey PRIMARY KEY (uuid);
 H   ALTER TABLE ONLY public.chat_message DROP CONSTRAINT chat_message_pkey;
       public            postgres    false    225            �           2606    114634    comment comment_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (uuid);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    226            �           2606    114641    content content_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (uuid);
 >   ALTER TABLE ONLY public.content DROP CONSTRAINT content_pkey;
       public            postgres    false    227            �           2606    114613 0   databasechangeloglock databasechangeloglock_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
       public            postgres    false    223            �           2606    114648    follow follow_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY public.follow DROP CONSTRAINT follow_pkey;
       public            postgres    false    228            �           2606    114655    friend friend_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT friend_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY public.friend DROP CONSTRAINT friend_pkey;
       public            postgres    false    229            �           2606    114663 "   friend_request friend_request_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.friend_request
    ADD CONSTRAINT friend_request_pkey PRIMARY KEY (uuid);
 L   ALTER TABLE ONLY public.friend_request DROP CONSTRAINT friend_request_pkey;
       public            postgres    false    230            �           2606    114670    images images_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public            postgres    false    231            �           2606    114678 "   import_failure import_failure_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.import_failure
    ADD CONSTRAINT import_failure_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.import_failure DROP CONSTRAINT import_failure_pkey;
       public            postgres    false    233            �           2606    114686 $   media_resources media_resources_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.media_resources
    ADD CONSTRAINT media_resources_pkey PRIMARY KEY (file_uuid);
 N   ALTER TABLE ONLY public.media_resources DROP CONSTRAINT media_resources_pkey;
       public            postgres    false    234            �           2606    114695    notification notification_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (uuid);
 H   ALTER TABLE ONLY public.notification DROP CONSTRAINT notification_pkey;
       public            postgres    false    235            �           2606    114710    post_folder post_folder_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.post_folder
    ADD CONSTRAINT post_folder_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY public.post_folder DROP CONSTRAINT post_folder_pkey;
       public            postgres    false    237            �           2606    114703    post post_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (uuid);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public            postgres    false    236            �           2606    114718    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            postgres    false    238            �           2606    114726    reaction reaction_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT reaction_pkey PRIMARY KEY (uuid);
 @   ALTER TABLE ONLY public.reaction DROP CONSTRAINT reaction_pkey;
       public            postgres    false    239            �           2606    114733    refreshtoken refreshtoken_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.refreshtoken
    ADD CONSTRAINT refreshtoken_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.refreshtoken DROP CONSTRAINT refreshtoken_pkey;
       public            postgres    false    240            �           2606    114739    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    241            �           2606    114746    thread thread_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT thread_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY public.thread DROP CONSTRAINT thread_pkey;
       public            postgres    false    242            �           2606    114772     user uk2k9xy9tqmu8mbgft9jveask7e 
   CONSTRAINT     b   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uk2k9xy9tqmu8mbgft9jveask7e UNIQUE (user_name);
 L   ALTER TABLE ONLY public."user" DROP CONSTRAINT uk2k9xy9tqmu8mbgft9jveask7e;
       public            postgres    false    243            �           2606    114764     post uk39xgrfuhegqlxqqxo170smg70 
   CONSTRAINT     c   ALTER TABLE ONLY public.post
    ADD CONSTRAINT uk39xgrfuhegqlxqqxo170smg70 UNIQUE (content_uuid);
 J   ALTER TABLE ONLY public.post DROP CONSTRAINT uk39xgrfuhegqlxqqxo170smg70;
       public            postgres    false    236            �           2606    114762 #   content uk4q25dj3fnyso7itfv8o2bgn0y 
   CONSTRAINT     c   ALTER TABLE ONLY public.content
    ADD CONSTRAINT uk4q25dj3fnyso7itfv8o2bgn0y UNIQUE (file_uuid);
 M   ALTER TABLE ONLY public.content DROP CONSTRAINT uk4q25dj3fnyso7itfv8o2bgn0y;
       public            postgres    false    227            �           2606    114774     user ukhl4ga9r00rh51mdaf20hmnslt 
   CONSTRAINT     ^   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT ukhl4ga9r00rh51mdaf20hmnslt UNIQUE (email);
 L   ALTER TABLE ONLY public."user" DROP CONSTRAINT ukhl4ga9r00rh51mdaf20hmnslt;
       public            postgres    false    243            �           2606    114760 #   comment ukhyec14qwygveh5cfd1at9fbrn 
   CONSTRAINT     f   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT ukhyec14qwygveh5cfd1at9fbrn UNIQUE (content_uuid);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT ukhyec14qwygveh5cfd1at9fbrn;
       public            postgres    false    226            �           2606    114770 "   thread ukks3vmgwekhe4a42ja5fsq9a7b 
   CONSTRAINT     e   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT ukks3vmgwekhe4a42ja5fsq9a7b UNIQUE (content_uuid);
 L   ALTER TABLE ONLY public.thread DROP CONSTRAINT ukks3vmgwekhe4a42ja5fsq9a7b;
       public            postgres    false    242            �           2606    114766 (   refreshtoken ukor156wbneyk8noo4jstv55ii3 
   CONSTRAINT     d   ALTER TABLE ONLY public.refreshtoken
    ADD CONSTRAINT ukor156wbneyk8noo4jstv55ii3 UNIQUE (token);
 R   ALTER TABLE ONLY public.refreshtoken DROP CONSTRAINT ukor156wbneyk8noo4jstv55ii3;
       public            postgres    false    240            �           2606    114768 (   refreshtoken ukruc6og7vt53oe7pxflxpim06q 
   CONSTRAINT     h   ALTER TABLE ONLY public.refreshtoken
    ADD CONSTRAINT ukruc6og7vt53oe7pxflxpim06q UNIQUE (user_uuid);
 R   ALTER TABLE ONLY public.refreshtoken DROP CONSTRAINT ukruc6og7vt53oe7pxflxpim06q;
       public            postgres    false    240            �           2606    114753    user user_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (uuid);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    243            �           2606    114758    user_roles user_roles_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_uuid, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    244    244            �           2606    114785 (   chat_message fk480k39pi7t4sel93iplol02gn    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT fk480k39pi7t4sel93iplol02gn FOREIGN KEY (sender_uuid) REFERENCES public."user"(uuid);
 R   ALTER TABLE ONLY public.chat_message DROP CONSTRAINT fk480k39pi7t4sel93iplol02gn;
       public          postgres    false    4842    243    225                       2606    114895     post fk4p70i927vrud37aqdrfivml4k    FK CONSTRAINT     �   ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk4p70i927vrud37aqdrfivml4k FOREIGN KEY (user_uuid) REFERENCES public."user"(uuid);
 J   ALTER TABLE ONLY public.post DROP CONSTRAINT fk4p70i927vrud37aqdrfivml4k;
       public          postgres    false    243    4842    236            
           2606    114920 (   refreshtoken fk6n3ffasdm6mubjslkye8318wm    FK CONSTRAINT     �   ALTER TABLE ONLY public.refreshtoken
    ADD CONSTRAINT fk6n3ffasdm6mubjslkye8318wm FOREIGN KEY (user_uuid) REFERENCES public."user"(uuid);
 R   ALTER TABLE ONLY public.refreshtoken DROP CONSTRAINT fk6n3ffasdm6mubjslkye8318wm;
       public          postgres    false    243    4842    240            �           2606    114855 *   friend_request fk6xrfd5h47xndalma9kn6yomwe    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend_request
    ADD CONSTRAINT fk6xrfd5h47xndalma9kn6yomwe FOREIGN KEY (requester_uuid) REFERENCES public."user"(uuid);
 T   ALTER TABLE ONLY public.friend_request DROP CONSTRAINT fk6xrfd5h47xndalma9kn6yomwe;
       public          postgres    false    230    4842    243            �           2606    114800 #   comment fk75u7p9vcoeqwueikrh0ql8ahv    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk75u7p9vcoeqwueikrh0ql8ahv FOREIGN KEY (post_uuid) REFERENCES public.post(uuid);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT fk75u7p9vcoeqwueikrh0ql8ahv;
       public          postgres    false    236    226    4816                       2606    114915 $   reaction fk849oowcrgujc60tsabcmdaq3a    FK CONSTRAINT     �   ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT fk849oowcrgujc60tsabcmdaq3a FOREIGN KEY (post_uuid) REFERENCES public.post(uuid);
 N   ALTER TABLE ONLY public.reaction DROP CONSTRAINT fk849oowcrgujc60tsabcmdaq3a;
       public          postgres    false    239    236    4816            �           2606    114840 "   friend fk84mpvshqph5m2h2cp87icjmq6    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT fk84mpvshqph5m2h2cp87icjmq6 FOREIGN KEY (user_uuid) REFERENCES public."user"(uuid);
 L   ALTER TABLE ONLY public.friend DROP CONSTRAINT fk84mpvshqph5m2h2cp87icjmq6;
       public          postgres    false    243    4842    229            �           2606    114795 #   comment fk8eq1kxojehvk1gs1wsks8fxdr    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk8eq1kxojehvk1gs1wsks8fxdr FOREIGN KEY (content_uuid) REFERENCES public.content(uuid);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT fk8eq1kxojehvk1gs1wsks8fxdr;
       public          postgres    false    226    4798    227            	           2606    114910 $   reaction fk9kopu5tsdatct6rt37esl6ei2    FK CONSTRAINT     �   ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT fk9kopu5tsdatct6rt37esl6ei2 FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 N   ALTER TABLE ONLY public.reaction DROP CONSTRAINT fk9kopu5tsdatct6rt37esl6ei2;
       public          postgres    false    4842    243    239                       2606    114890     post fk9qrnqusvvcutw47la7eb24hpe    FK CONSTRAINT     �   ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk9qrnqusvvcutw47la7eb24hpe FOREIGN KEY (folder_uuid) REFERENCES public.post_folder(uuid);
 J   ALTER TABLE ONLY public.post DROP CONSTRAINT fk9qrnqusvvcutw47la7eb24hpe;
       public          postgres    false    4820    237    236                       2606    114925 "   thread fkbynemexie87f4a39f58lcuito    FK CONSTRAINT     �   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT fkbynemexie87f4a39f58lcuito FOREIGN KEY (chat_message_uuid) REFERENCES public.chat_message(uuid);
 L   ALTER TABLE ONLY public.thread DROP CONSTRAINT fkbynemexie87f4a39f58lcuito;
       public          postgres    false    225    242    4792                       2606    114940 &   user_roles fkca2sbdcep8lnkfnpwxhjuqu32    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkca2sbdcep8lnkfnpwxhjuqu32 FOREIGN KEY (user_uuid) REFERENCES public."user"(uuid);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkca2sbdcep8lnkfnpwxhjuqu32;
       public          postgres    false    243    244    4842            �           2606    114835 "   friend fkdel13j2yyq9ar2s2km17o7vom    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT fkdel13j2yyq9ar2s2km17o7vom FOREIGN KEY (friend_uuid) REFERENCES public."user"(uuid);
 L   ALTER TABLE ONLY public.friend DROP CONSTRAINT fkdel13j2yyq9ar2s2km17o7vom;
       public          postgres    false    4842    229    243            �           2606    114780 (   chat_message fke7lr1k6roxma55304u3silxiy    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT fke7lr1k6roxma55304u3silxiy FOREIGN KEY (receiver_uuid) REFERENCES public."user"(uuid);
 R   ALTER TABLE ONLY public.chat_message DROP CONSTRAINT fke7lr1k6roxma55304u3silxiy;
       public          postgres    false    225    243    4842            �           2606    114850 *   friend_request fkerjcyb0ou2wtk6qlei8rci4vv    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend_request
    ADD CONSTRAINT fkerjcyb0ou2wtk6qlei8rci4vv FOREIGN KEY (receiver_uuid) REFERENCES public."user"(uuid);
 T   ALTER TABLE ONLY public.friend_request DROP CONSTRAINT fkerjcyb0ou2wtk6qlei8rci4vv;
       public          postgres    false    230    243    4842                       2606    114885     post fkfegeofcphekrppa893gnswiui    FK CONSTRAINT     �   ALTER TABLE ONLY public.post
    ADD CONSTRAINT fkfegeofcphekrppa893gnswiui FOREIGN KEY (content_uuid) REFERENCES public.content(uuid);
 J   ALTER TABLE ONLY public.post DROP CONSTRAINT fkfegeofcphekrppa893gnswiui;
       public          postgres    false    236    227    4798            �           2606    114805 #   content fkfx1xcj7vvd6dbup8lghg7p8o3    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT fkfx1xcj7vvd6dbup8lghg7p8o3 FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 M   ALTER TABLE ONLY public.content DROP CONSTRAINT fkfx1xcj7vvd6dbup8lghg7p8o3;
       public          postgres    false    227    4842    243            �           2606    114825 "   follow fkgnd3fhbms6xv8l8if0wmxaebr    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT fkgnd3fhbms6xv8l8if0wmxaebr FOREIGN KEY (following_uuid) REFERENCES public."user"(uuid);
 L   ALTER TABLE ONLY public.follow DROP CONSTRAINT fkgnd3fhbms6xv8l8if0wmxaebr;
       public          postgres    false    243    4842    228                       2606    114880 (   notification fkh7xf6e0ta4i3jtwv03i9f6ff7    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fkh7xf6e0ta4i3jtwv03i9f6ff7 FOREIGN KEY (sender_uuid) REFERENCES public."user"(uuid);
 R   ALTER TABLE ONLY public.notification DROP CONSTRAINT fkh7xf6e0ta4i3jtwv03i9f6ff7;
       public          postgres    false    243    4842    235            �           2606    114820 "   follow fkjploejrd49bhbkpkolatu2xb0    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT fkjploejrd49bhbkpkolatu2xb0 FOREIGN KEY (follower_uuid) REFERENCES public."user"(uuid);
 L   ALTER TABLE ONLY public.follow DROP CONSTRAINT fkjploejrd49bhbkpkolatu2xb0;
       public          postgres    false    4842    243    228            �           2606    114810 #   content fkkwi3qw8iacwvhqdv6glmenfsm    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT fkkwi3qw8iacwvhqdv6glmenfsm FOREIGN KEY (file_uuid) REFERENCES public.media_resources(file_uuid);
 M   ALTER TABLE ONLY public.content DROP CONSTRAINT fkkwi3qw8iacwvhqdv6glmenfsm;
       public          postgres    false    227    4812    234                       2606    114930 "   thread fkkwk9111ofqyfr932ldmeme13k    FK CONSTRAINT     �   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT fkkwk9111ofqyfr932ldmeme13k FOREIGN KEY (content_uuid) REFERENCES public.content(uuid);
 L   ALTER TABLE ONLY public.thread DROP CONSTRAINT fkkwk9111ofqyfr932ldmeme13k;
       public          postgres    false    227    4798    242            �           2606    114775 #   address fkmlhyvta73l6ubylyl24usjs0r    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT fkmlhyvta73l6ubylyl24usjs0r FOREIGN KEY (user_uuid) REFERENCES public."user"(uuid);
 M   ALTER TABLE ONLY public.address DROP CONSTRAINT fkmlhyvta73l6ubylyl24usjs0r;
       public          postgres    false    224    4842    243                       2606    114875 (   notification fkne403u5pq2dt7kruagenpo3vj    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fkne403u5pq2dt7kruagenpo3vj FOREIGN KEY (receiver_uuid) REFERENCES public."user"(uuid);
 R   ALTER TABLE ONLY public.notification DROP CONSTRAINT fkne403u5pq2dt7kruagenpo3vj;
       public          postgres    false    235    4842    243            �           2606    114830 "   friend fkpf2nnroq3osd9vyx0p06djtdn    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT fkpf2nnroq3osd9vyx0p06djtdn FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 L   ALTER TABLE ONLY public.friend DROP CONSTRAINT fkpf2nnroq3osd9vyx0p06djtdn;
       public          postgres    false    243    229    4842                        2606    114870 +   media_resources fkphgtbab69ul4m2slf3hkben3j    FK CONSTRAINT     �   ALTER TABLE ONLY public.media_resources
    ADD CONSTRAINT fkphgtbab69ul4m2slf3hkben3j FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 U   ALTER TABLE ONLY public.media_resources DROP CONSTRAINT fkphgtbab69ul4m2slf3hkben3j;
       public          postgres    false    4842    234    243            �           2606    114860 "   images fkqi7mxuwm9b020bjliyto55a8p    FK CONSTRAINT     �   ALTER TABLE ONLY public.images
    ADD CONSTRAINT fkqi7mxuwm9b020bjliyto55a8p FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 L   ALTER TABLE ONLY public.images DROP CONSTRAINT fkqi7mxuwm9b020bjliyto55a8p;
       public          postgres    false    231    4842    243                       2606    114905 #   profile fkr6muxb0sog1nrhr73xnykurvc    FK CONSTRAINT     �   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fkr6muxb0sog1nrhr73xnykurvc FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 M   ALTER TABLE ONLY public.profile DROP CONSTRAINT fkr6muxb0sog1nrhr73xnykurvc;
       public          postgres    false    4842    238    243                       2606    114935 &   user_roles fkrhfovtciq1l558cw6udg0h0d3    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkrhfovtciq1l558cw6udg0h0d3 FOREIGN KEY (role_id) REFERENCES public.role(role_id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkrhfovtciq1l558cw6udg0h0d3;
       public          postgres    false    241    244    4832            �           2606    114845 *   friend_request fkrokk0evnipgdn7i9hqo2fkuqm    FK CONSTRAINT     �   ALTER TABLE ONLY public.friend_request
    ADD CONSTRAINT fkrokk0evnipgdn7i9hqo2fkuqm FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 T   ALTER TABLE ONLY public.friend_request DROP CONSTRAINT fkrokk0evnipgdn7i9hqo2fkuqm;
       public          postgres    false    230    243    4842                       2606    114900 '   post_folder fkrpn909x59m2bkke1atmde1tqw    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_folder
    ADD CONSTRAINT fkrpn909x59m2bkke1atmde1tqw FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 Q   ALTER TABLE ONLY public.post_folder DROP CONSTRAINT fkrpn909x59m2bkke1atmde1tqw;
       public          postgres    false    4842    237    243            �           2606    114790 #   comment fkrsj4fci5mnnta7m28pbk0xfil    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fkrsj4fci5mnnta7m28pbk0xfil FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT fkrsj4fci5mnnta7m28pbk0xfil;
       public          postgres    false    243    226    4842            �           2606    114815 "   follow fkrsylcyvcdgwppj0rxs693aoda    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT fkrsylcyvcdgwppj0rxs693aoda FOREIGN KEY (created_by) REFERENCES public."user"(uuid);
 L   ALTER TABLE ONLY public.follow DROP CONSTRAINT fkrsylcyvcdgwppj0rxs693aoda;
       public          postgres    false    228    4842    243            �           2606    114865 "   images fkte3f11v3aog95li902gimrcmi    FK CONSTRAINT     �   ALTER TABLE ONLY public.images
    ADD CONSTRAINT fkte3f11v3aog95li902gimrcmi FOREIGN KEY (content_uuid) REFERENCES public.content(uuid);
 L   ALTER TABLE ONLY public.images DROP CONSTRAINT fkte3f11v3aog95li902gimrcmi;
       public          postgres    false    4798    231    227            �      x������ � �      �      x������ � �      �   A  x���͊G��}�"/���[���/��*�HV������8�Ǔ@Cӭ��ԧ�^�1�n "��`�u�q�x3�#5@��p���"OԅT�/��G����/�<;���m0�h1��������9���z�������p�-=���%�rbнg��&�se�%$��4m0ϴl��{^�"}�B+Qx����u�[OCi��pဘ�A&��;�G��}�Y�v�N�<��;��o�:5k�����y��:_����Ӕ~4R$���|m���$��;�|e"��Y��Z(��n)[�3�=�р�ٛ8��Z�cc����4�k�n��t�#���ݸk+p5��ל�'4�##e�]�;�hs���=V��-71�I����u>6�#H-k�h�"�$If�5�Q���-���^zU(窜ITN��0th1��k������?�|�0)�޲x��o;ڱٴr��V��L�!m���y�;�8������P}����m�Z!���^��L�ޑ�����ȱ�"p�V���q4�:�D��ZTJ��c͘�t�km�qr���ʉ��-u��n_�n����'�      �   W  x���=n\9���)���nv7�'���	����������3{9��{�d9��O/;.�������h��jl��D1�5g�Ԛ$�Q D ݣb<H\$����Vc���o���??ܞ��}z��r�?���~�c�^[�`e�jOP��L^q�"��+��!O���s�N8iR�Q;�����|Z��Yڀ{R������O{�Y�"�	Ğ
0��)�ԚgT�~Ɗ��ʓ�'V�Y%@Y{��)����R����}���tw��Ǜ���^��Q�8"�L���*�D�*�kk? .���7��T"��+���s�9�욛���k���@r�]rq���f�=v���1��(��j|���ps�ߟ�����p��/�Z��!��ùp�Z�$��bX�&|`Z��T_~W�!�c�˩j��f��!'�Q'�1�y0\�_􀴈Lc٠zRu���ҋ�[�en�[<?�
&&PL�2����8�2��qc�?�?�|���S�����c�N0��{��`!1�܊��[k;���������J�0��J�..T)�@�Ar;g!���\���r���1ڂ�9��j�����Ů��!������@��      �   �  x���Mk�0��)|�`r�fK�`R���B2z(�z�d+�e�|�iv=�`d!�?�y����?��Ȏד'Y�P�t��}[��~�1l��'L?:�aS�Y�P��d�hJ)WJ ���js�W��Xsa���H%ke�82n��V5jJ���z�"�2��������QR��v.x<;�-�: ��ލ]�䞢�)��e�L�;�"
1�\�~���m�+��B��*�̹�x�,�kPj��fnq�k������ܽ�ϡ��������3�э�Df���B�rP"�ɩ0�,�g�`t��r�g��x��]۵���pz���,+���?�H�k5����Q�E�SƋ&�P�:o�������mT}���%A�R�� }@s/'��P�\|��.w���˲�I�ɾz��{��t�Z����      �      x�3�L��"�=... U�      �   ~   x����� ϡ�m��RD*���	K��;�4�Zvd2�� ����}xC	3>�� "P���*7ד)��>��ڻ��������!:1��q4�y$����ĲAT�7�z����{�R��x3�      �     x����mA೷�4�5<\D*�ef`+H��ڹD���G�RY�(!p��>�e��R��.�H �>�ol7�+	;����_��ȋ�j��ӧ#��l���i���z�{*p�	B�0�t��e�I��;�p��8!�;���%�p�k���[�O�Ğq��h��,�`fG��B�!Q{wr応~�vm=������˒����r�$�~�Y�FjVT�\j�����<z�hܭ5��5ǉ�b�'����e��m۾K���      �   �   x���1n�0 g�� ��H�[�f-:t�"J���Po��8��j�HTA�B#@�2,��΍������,z��J����/�v�ha��o�����c�Q׬P�.9g�h\���M:��ܲ�1�ï�4�C����%Ӿר�`pQ�I1]���E�⿻���ps��ϕ�td���T�֠u��S&t�i�uf�V_�zŴ?�}� hA      �   �  x���Yvb9���U�L,Y�m�+��\�p�!�o������'����_�]BRC�Є��T�
�Jh��������$�h�<������:͚�PЊ�he�g��0�OO������X��iw�����v������z��8�6�>��><���eM�Teuٞ�s�J�ƆI�&[��, �d�>BG�Խ�Ր�b�O
�(��Ġ8��C��W�@z�Q콐ϗ���K_��}5���C���W6��l�39�3\J�@(�dtͥ����PQ�쒘֬��� ����� ?��}�-$��{��MY���ڸ�����B~H����� &�&�:�b�j{U2B���*�`MΪ$vG�����{7E��>���W�@��N��y����zڞn~�����m1��HӵQ5ɗd(J�\[l��I��q,V�T�SȤ�]U]��F��p����=�b���]�;�e��Q��{��J��ZL���䍾>�C�F�>�JU�6�Y��&.
��l���ȇ���	;��i�l�w9�>�T�������8�N��m������:i	r0�$uY��=j
��d�	�A����ښ�\�Ĕ���:p�w���|��cvm��4_V�A\-�\Z��˭�`O&E���K��̀�2���d�yŽ;�혇�r��a�ϗ���0�l�E�a��ָ��Q0wL��ե)��A �w�j3ux'ny;�.R��2_rz��R��
�A�5&���\��{i�����9f=
�M��L�����[���-nԦ������;����2��xJ������L��<Ѳe� ��-�Z�Ǹq
0�܍������{�9mg����˼��X.���ڌ���o�!� Z�E���a���!�h�<��.hb�:a4�.Q	�8��*��<ߟ��s�^����2;��=��:&�E�Y���ɢ�h3���Q�تhJ8Q�z�T�{���r갿�ư_��vH��K�ߣu��|�Ԛԇq$1YSkBf�EM�1j ��!��.�jԊ�@��q�$�ɔ�)m�D�NL�|����n�4��sZ?HKR3D�@�w0QZ0F�[��6L����᷸蝅{qg��x�����qWxQv��m��>�[�f`��ɴT���1���:O����Bz�Y�L��*�8��W���㲻{�Y?��+דn�{��U�Aܬ���Ԩl�?xA+W�s�Ք�6������]�r��#��p:�w֦��qM��u.      �      x������ � �      �      x������ � �      �   �  x�͔��1�ϓ���`˲-�miS�e)!�T(�%����nٷ�K�m�9,�G�����Kι2�P� PV�R��r�b�j�qB������Jn�Ȕx�6kv~2��|�o��r�����z��v�2�l۞�o�קs��t������|���x�ޜ��m��5��2P�ե�Pj�a�5��5B�\��T� �����Db;��Sh:J��D��zG�`��e��`�x��Eo)Y5l@�ꨃf��Y�XL+�%�����_�?_]x����Ja2���J$�/0H!����W�%8����49)c�hlCoK��F51���Z�!��}�T�%�q�������eu�8�����=+�tәӏN
Jcr-�ߑ<.QX�_ſ���n���!cF      �   �  x���=n1���S�\H���S�4��H�t�#�6`[m#����99�i �,��;�\[O��2ۅ����ۃ�!x'����������R��z ��
�%0���<�k^�.K]rR����p,G���gW�}[N=;4�jfN0e,�&v�g&�~W��Ť'qR/��(`} �"I��_����3W5r�a��16S�rj����hs�1�]gJn�.7�6����\%����m��g��'j�Gǻ�Z�/j���u���&����ӛ�O%7�����.�=`�2 }i�'��V�ȳP���0�cp+�%�j���ݥ��7��N�o�cV�����`�3����k�)�ڂ�fɝ}��pTgx�S�5%7�r֭��҈�A;y�|�_��x7n��[�Ѳ�]��J״�8dNь���H�9w��oU\��PQ^ɫ�Fݰ>Lk��O�5?Uj�,r[k_�SK�����ֹO�HX��S�Db0c��)_�~)!�����h��      �   �  x���;�T1E��U���U��녈�L��'"@����$b&g������,'��=u�%�5�zw�sBI��d��<���@���e�I7�Lh��O��Ǭ��_�]�p�\�w��*�k�҇�#��>�k����sq�d���M��)���8���-����!��aL#C8e�֪qEe��ͽ�����P��9���8�d�	9���~8�};=���zz9�����|~�z��U�)aj=C��VE���	H)�����d�	y'Y+�<�[�Gz)���d��Rj�Bmxx`r�2WY)`F��Ě�jm��-�>�v�і������u��J�NtD�	��C��-ַY}�Z�ڑ��l�͵ ��rt���m��Q��cW��zڎ��o�L�:      �   �  x���K��0�񱻊�'���̐��H2�c��m��>r��rX;!���ͬ�cK?�?�0`�"R����LehjK�q�`�'�`&cܠARO�~,�<�1+���ޥ9+�.S�:�s�tn��\��')����p�x3%I�v8�	 p
���?|'��}z&y������k\	aSH�
���:a��"P�KG�U.�m�rc��w,$d,�}S����SS��D:S��G���\�$����Um�����.���]�x+��R\KMP^VAR���EN�e�ʲtZ8T��E*�K,�������'[z���F?���l�e�����6��Ɠ�I�-��F~x����L'5��H�X�5HDE��h���[��&� �	c�R�|��|i.$�GZ���U�.���^g2�t��ծ��s��)�lVEM=����Y����ͷl������      �   �  x���ˊdE��UO1/EDf\ϮAaD�.��]4(��5� SM��u�D}�ǗQ�z�2�M沠�j�k�}�V��K��@E?�Վ�ʎl����_?a��$,�j��ǧ�O��SqE@4��Y<��h��m�\�B.X�+A'͢z]Lz���xA���	�͠�K`:�H�Z������ߞ#n��@	+=��_��a�9J��Y%�����e��V��|ʐ�p��Q���F�V�+1=��rS��r���KC��y�dq��K����i���ޖG(���2b��`z�U�;�\�����f��"�)�:ν:�,n3f�)���ޯ�7�l�=�G��=+,o�}"�G)�$.�����������o�Q~Q�DyUçv�S�.˩�U�G� c4�FʱΩ!8��Q��s@Ǭ���Gd.do�oI^�s�9�}Ji���:U�������e+]a|{�$ndf(���^�w/���>%	IPo��6�I�yk�O��O��u?�-zp���Zׯ�֣�]���b_b^���z��u�tQ7.ѕh�~�b���
,�����{5�M�$���=����Q�X5����O��9�I������6I��������T����9ps.M�a�!�I%,����L���'.tc����������3�Z��9�ޠi�n���͘J����%v�X����iZYyiV�m3����z��	�5ܗ      �     x�U��m�@c���x.I��d���rbL8�	������Cq��S��B?tD�2��$� ie�zx��aeB�wT�������UYig��c�r^֢��,�f"E��}dB�OH�����G�6�YR>@�F����];5��,�cŇ�f���H��"�k�Jp�F����O���utsD���{�� �+GZ�z�?V�wF�K�������C�Ag�Z+��b��3�(�Vs��u������T�ш�9��������e�      �   .   x�3���q�v�2��]|=���!_� �� �=... �      �      x������ � �      �   �  x�}�KS�@��5��`ۡ�f5��!
�%Xn���0���GT9NUg�>u>`LB�,����r�rN����r+P6��cQa�;8��oL���jӨ�ïkR�$���ϥ����A7���5TqxZ�-��lj��x�>Z&pK�ޤ{��A1�D�/�ns泀h�.U/pҊ�����S`�jʐ�s��!�k�R������c�_�&�a��ҤU���긎zTl�r�V�2%���|�
;��v.��O+i�O�V��۞
c�"�f�C@�� f
�Ֆ8��Wr��T�opVU��(�W;�}7�fl�ϳA�KŮS��F���2�/����i�m�}Ɣ�R�(w��H��>p����Z'h�ߔ���>T�vU���.��nr�S?-p��>n]?��E��a�A���o}��'�Q..U���<�/���      �   v   x��A!�u��O� �]���!3�W�Ŭu2�wl��Bt�82,�螘j;5��	��Q������'���\�/&�6��&x/E�U��ֆ��2��<Ӓ���Sϙee/�}[k��'�     