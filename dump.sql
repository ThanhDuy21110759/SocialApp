PGDMP  	                     |            SocialMedia    16.3    16.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    224   ��       �          0    114621    chat_message 
   TABLE DATA           Z   COPY public.chat_message (uuid, last_uploaded_at, receiver_uuid, sender_uuid) FROM stdin;
    public          postgres    false    225   
�       �          0    114628    comment 
   TABLE DATA           |   COPY public.comment (uuid, created_at, last_modified_by, last_modified_at, created_by, content_uuid, post_uuid) FROM stdin;
    public          postgres    false    226   d�       �          0    114635    content 
   TABLE DATA           w   COPY public.content (uuid, created_at, last_modified_by, last_modified_at, message, created_by, file_uuid) FROM stdin;
    public          postgres    false    227   ��       �          0    114604    databasechangelog 
   TABLE DATA           �   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          postgres    false    222   ��       �          0    114609    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          postgres    false    223   e�       �          0    114642    follow 
   TABLE DATA           �   COPY public.follow (uuid, created_at, last_modified_by, last_modified_at, is_blocked, is_muted, created_by, follower_uuid, following_uuid) FROM stdin;
    public          postgres    false    228   ��       �          0    114649    friend 
   TABLE DATA           �   COPY public.friend (uuid, created_at, last_modified_by, last_modified_at, is_active, created_by, friend_uuid, user_uuid) FROM stdin;
    public          postgres    false    229   ��       �          0    114656    friend_request 
   TABLE DATA           �   COPY public.friend_request (uuid, created_at, last_modified_by, last_modified_at, status, created_by, receiver_uuid, requester_uuid) FROM stdin;
    public          postgres    false    230   ��       �          0    114664    images 
   TABLE DATA           �   COPY public.images (uuid, created_at, last_modified_by, last_modified_at, name_image, url_image, created_by, content_uuid) FROM stdin;
    public          postgres    false    231   3�       �          0    114672    import_failure 
   TABLE DATA           d   COPY public.import_failure (id, file_uuid, primary_key, reason_key, reason_value, type) FROM stdin;
    public          postgres    false    233   t�       �          0    114679    media_resources 
   TABLE DATA           �   COPY public.media_resources (file_uuid, created_at, last_modified_by, last_modified_at, is_external, file_description, file_name, file_path, file_size, file_thumbnail, file_type, is_success, created_by) FROM stdin;
    public          postgres    false    234   ��       �          0    114687    notification 
   TABLE DATA           �   COPY public.notification (uuid, created_at, images_url, message, status, title, type, unread, receiver_uuid, sender_uuid) FROM stdin;
    public          postgres    false    235   ��       �          0    114696    post 
   TABLE DATA           c   COPY public.post (uuid, created_date_at, status, content_uuid, folder_uuid, user_uuid) FROM stdin;
    public          postgres    false    236   ��       �          0    114704    post_folder 
   TABLE DATA           m   COPY public.post_folder (uuid, created_at, last_modified_by, last_modified_at, name, created_by) FROM stdin;
    public          postgres    false    237   }�       �          0    114711    profile 
   TABLE DATA           �   COPY public.profile (id, created_at, last_modified_by, last_modified_at, avatar, bio, date_of_birth, first_name, gender, is_online, last_name, middle_name, phone_number, created_by) FROM stdin;
    public          postgres    false    238   W�       �          0    114719    reaction 
   TABLE DATA           ~   COPY public.reaction (uuid, created_at, last_modified_by, last_modified_at, reaction_type, created_by, post_uuid) FROM stdin;
    public          postgres    false    239   ,�       �          0    114727    refreshtoken 
   TABLE DATA           I   COPY public.refreshtoken (id, expiry_date, token, user_uuid) FROM stdin;
    public          postgres    false    240   ��       �          0    114734    role 
   TABLE DATA           2   COPY public.role (role_id, role_name) FROM stdin;
    public          postgres    false    241   w�       �          0    114740    thread 
   TABLE DATA           `   COPY public.thread (uuid, senderuuid, time_stamps, chat_message_uuid, content_uuid) FROM stdin;
    public          postgres    false    242   ��       �          0    114747    user 
   TABLE DATA           �   COPY public."user" (uuid, default_locale, email, is_active, last_login_at, last_updated_at, password, register_date_at, user_name) FROM stdin;
    public          postgres    false    243   ��       �          0    114754 
   user_roles 
   TABLE DATA           8   COPY public.user_roles (user_uuid, role_id) FROM stdin;
    public          postgres    false    244   ~�       �           0    0    address_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.address_seq', 1, false);
          public          postgres    false    217            �           0    0    import_failure_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.import_failure_id_seq', 1, false);
          public          postgres    false    232            �           0    0    import_failure_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.import_failure_seq', 1, false);
          public          postgres    false    216            �           0    0    profile_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.profile_seq', 1001, true);
          public          postgres    false    218            �           0    0    reaction_count_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reaction_count_seq', 1, false);
          public          postgres    false    219            �           0    0    refreshtoken_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.refreshtoken_seq', 951, true);
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
       public          postgres    false    4798    231    227            �      x������ � �      �   J  x�����1E��*� ; ~$�' ��K��8�|�^,4�{.m䰎#�A�R�2۞��_� 5@�E��x�TզW�eX��!�dA� n�t����;��A` ����UzS����N����b�V�5e� ���<�wf���j�<�@�:$چ)�ӈ��/I"��}���� |�᳸u��$��D�e}]>{e�D�}�&/;$G�F*n��Ăz�y�#D�C���O�ig��'��3x��K�ک!����N`��5��ߑ��ܞ�)�d�s'�Hk��\���v��ɿZr�e�{)p�<�?��A�.A&^����?�	��      �   C  x���M��G�ןO��������r6�C)Y��R"���=����R������N��	��
�����k_�^�� }�va����I�r|�����I|�M0CdN�^mnb��FRj�^�?����ﯱ>���|�ؖ��W %��:g7��q0�]YdH��е"��5P������LZ08&X�j�$xµ�5X���of���6��{ܷ����)=�w}�g}4�Y���s>��ӊ�?m�P�R����??cy�Rd)�;x�1��fOIh_5QDҝ�mq�;�9eRi0j���ùMZt�.+5��u�mbm{�V>MW��	.w�?¹�e���
�t�n��Y*:����G��WQ�Q�]�Y��
M��"��
����g)��1W.��D�``ҙR|(ў�)�J}��d�NƜ�j��D7����~4sO�U�<�+�
��F�޶�Ns�֎5u��5+��`K���v�}�n�P;��? w}W�&�	4E���=[/���E�^q_9���>�����.P�ʤ�=�p:V_}n9�d[;0�np])%�d6���qJ[p�	Sc��c�8��Ca�\� Y����R�R0/�\\�|����6ږ��z���S�y۽0z����c!Ƣ��ҳ��M�A	�zY-oC����zp.+�����(�:p�ֱ�h��H�x_�?,�:[��k�C�➧,`.��F9V�hѯ��g�Q�k�^H.�.h�*U�� �a���Pm���H���x/`�Y�m�x\�R�&8z��K�NsM�����:A��K>�XH��������[�|�b�u�u*�O����/����      �   �
  x��XK�+G^�����V�f�n"P"!B7Yԫ�����}o�E~ B+R6!��HH�.Xd��	|e����ai�i�����y|�*����Lcr�*�*�v4��9k+��rN�!�M��h�h�g���T2m��kןv�rX���߼�|M�����Y�Ҕ�#e.B�)�FfZ����pަ���!Y�
�z��	�tN�ݦ�l�&�W-hw���r�8���y�1g.��۬�,6R%���IuJ�����2�ZD
�J�4�hh�)Lom9Tl&J5�(��X�ҧ$���v='�"L��d`��"H	�R����[A�JK����P��p�.��G�m�Bx&�%τʆ�;�L�M�*oBֹ��7nL�C�V4�REϱN8��X��HŹǊ�k<��s���a�(�Hb����y���PZ�Y(�J�<�^�^FsBk�g�v�j�D��<x+���C���Q��l�fҮPł�A�l]����ѯ̈́�Fk(�GPm�Rs˜���Y�CD̫,kR&��4:���lrx�X����ߓ�y���'[��?���"h��3N�����q^x'�Cn�X�<�V���jf"��r�d�!3AQr�3�� �t
9��*�X1w^�]i��ܸ��Ο��L�f�Bj���F��������0��e��|���*}m'Io^~ѓ��~qڲ��;��*l���L�⣏<��,�2,\��H�i�p2C�d�9�=(~��k�R`�C��Rƴ��r�����?~��o�NVc�+�n^}�K7�~۝|��P(X�4��Q%M�>+�����eD��B�l"x-JX{�R-�q{��ן^�qv���ϩ�|5�!R��V�AS�YQB����4r�Q/�'�J��ERe$��[a��E��"݊,�e�Г�ְd�^Ĳ\��gR�_c�Я�M��ˏ~�ºB桟�Q��n~���9�(�$�����/W��ǁ\�q,�~uN�ôK�=����n,�o�.v�n�ʪ!��W�r9�yY��0^r���rI�|X�%���~>����n��JZ�qU��:,�Si�>��/_��'\z�<䌶Qn��%y�mFkb�,2hߤ��6�s)�c��Iw��,\��7�~��\��/��0Y�Y��S�D�K��q�/T�Q�9:����ZBL�k�^�=�;Rό����e��2$w�����,�#��t}��w�7�&O/�ݜp���_A����[�E�aC�ü���a~�0�����tF~X�ЭVn"/f���4"�H}B� t���eXOg�j�sR�iח�z�:P-}^����UZ�/�a����L3X�g�]��Y7/d�Hjâ�{]�ϯ�����0���T_ �Y}3_hA��\�Ë���r�m?�%���q�.��G��K=���6���U�����xUm�Z���v�u��s�ЇqX\�@�q9���8������0]��~lP���/�<��〄�jȽG�E����S����I� ��R*�i�;PjuI�젻[�E8Ʈ�fk�&'�,�ϟ�w7j��0���#_ˋ�b�PY��x��eוK��y�a�ʲ��K5N���GaL��c 7V�c�W%Wú��ӺaY\� �x�.���|h��N�ڻ���r��57��b�0ƅfZ��n6U_I�KB�����Q��b�W~���5��z�#�%z���@���s��Aձj"Yc �CT�Rn�_g����3�����sQ4{̙��-.gt�E�S���������˴E�r$vw����� �Nܛd���p2��n5��AcQ�|6N��[�.[c��G>H�(��eY|�Ң9P�1LA�S+��z �W6�-�����h�a�P�Tr̫�lV9�VS�Z� �����az@S�Ze�MQ�|�����X��-�N#�Ϟ��a��V�ɭ�t�^����z�d\a���l�U�	Ѝ O9���tK������ΐN���F�b1A��!�b����PB��}������~kW�\md�׿_���ן����?�kӛ�����A��.i�h�T�����V�f�[s�B���cR���t�Io^~���EH&l��{��p�����-�heNJ�xG���zw�;zg��pѕ�6�1ܝ��xj�C�2�10��7.m�y8��L�i��J�#*w���!o~c�H���� w����IB���cʥZ4:�Xh�JI��g�<T�q�5:��V�0%�}o�.j/����H[P��ǘݶF�Ch%;����R'f�#ڶR�1�����|!o/P~J���ͩ1͔�����D���7ҽ^�d�����G�1E��A	�n��;�����Q��D}��c�plB1Pz�5��[�{0{�>��1�����V����nS�a�9}A0�<-`��.S��EV���2�����jސ4s��|�+�Rn����.0w�������T�B�f�+E�xs_�SѬ��xo��q�8K��Rqv��!C���Zp�p\�*	����4��#ժ�t!���Rn����䄂3��ƔE����AF���ԭ(�����Z�@[{�ޕJ�@Ϲ���a�֠����@<��0I�a	�-�NZ�Z�
�#
jbe���r�Q��}�ړʍ�G]��r^�^S��.�9�¨1�k{a8�'b4"�����N�d��zE��cp�R���3��ۻD��f�C�4'C���U�f���+����	���(V��,������r����?�I�ꯡF3�^��#��?�3�ՙl$ρ��!]`��*�~�y���$Á      �   �  x���Mk�0��)|�`r�fK�`R���B2z(�z�d+�e�|�iv=�`d!�?�y����?��Ȏד'Y�P�t��}[��~�1l��'L?:�aS�Y�P��d�hJ)WJ ���js�W��Xsa���H%ke�82n��V5jJ���z�"�2��������QR��v.x<;�-�: ��ލ]�䞢�)��e�L�;�"
1�\�~���m�+��B��*�̹�x�,�kPj��fnq�k������ܽ�ϡ��������3�э�Df���B�rP"�ɩ0�,�g�`t��r�g��x��]۵���pz���,+���?�H�k5����Q�E�SƋ&�P�:o�������mT}���%A�R�� }@s/'��P�\|��.w���˲�I�ɾz��{��t�Z����      �      x�3�L��"�=... U�      �   ]  x����m1E�o�xp@��SD*����_��� v#����.ρ�̘d 	B�Apq4yXi��� b��/����d��_�K�>E�ጀHq�)��=+,��3�1�m�� ��K6+4�]J4#Z�魦��T#���xA.�Vk���d�gd«���B�����%�Z+�o'H��uF�Fc���t4f�s�~&����������� �'�Ez��5��>��M_B?�z�騫f�0��m�:�	T��,\���=I.���6����M_B>��
<�P&C� ���I&1�	�i:*��ͺ@삹�(�%��A&|ܼ���&�Y������Co�q����      �   �  x���Kn1�u|�\�)>D�=A6��9A��q���r������Ė4��>3'�T����M������n�&���>~������l�r����+��D;`I�iDǚ��iS�T���ÌƠk�.�L�.Az0��� I"�Cy�^2��?�(�b^b�'���TE�>�bf��C ����wo��/���أa�����l�4��!�PI��{�6R��B/ɥ6]7V�~�Dp7D�6\�s��F��H?�g';+�{dV�&�0��^ܽ ����/��c�m��ܛ�����;��޴r��e��+fL�:�ݕ��؏�iA08zE��s)z��>��kp��J��M,�c�G���O�5s%��4�x'���Y_ÙѾ�O��=���˒	�l��!�@���,}<���}��w�Tg?������F�      �   l  x���9�$GE��S�� �.�	=A2A�8���� VCR�#���?����: Q)&еw�խ�:/� ���;ꦮd~����J�Q.r����������O���xY6/��Ga�c4�F*�.�Yטл'�2�)ѕ����t=�Q�`V�I}����5�?r�^bss�����7t,�O�"SqE@4I�%���f�+V�sVg:]T*R	p���y@`�������m�����f5��[�ˣZy+h��iu
�UC4& N`'h��mE�Ns�S�ґ��(�)\3����k���J������(v*;�M���i���J�*;�V0��������<eujG���xX��/�KzX	��moܱ3f�V�Y}�~��~���ן�{��U�8$�b�=pr�I�]���VK�ey'7�oU�*+�'�SV�����gK�#��s�HK�f�,��[��rKˀ&e��h2�0���7Sԯ�����O�=��Z�p��L	3t)q ����K�B�y�U��I�nyd��<���N@Q�����8�sAxsX�Lh����OUw�-g�h�t��3m�����ϏW_�=x���S�l%Vm����t��خ��_Wi�4      �   1  x��ZYrۺ��V�@A7f-���`�,S3�տCߏX�����r�쀢p��g�lTdE��l������E!|d�]�/,Y�5�������wA:���������y�[�w�v���/�ө;�~�<��4o^�e����4�n��!���^����ۼ����~��Q�K\�b7���R��5�$�O^h[�H�6�5�d�ZN;�Pcmcs�*S�v:�"@F��s�I�>��aj���}	���H'[9��w��m�]��b~�n_|�ɴb��.	�U�X	�st:�ա ��*���܄�@�T��V)C��?�����A.|���#Hc�[���5o�\�[�6�[�>�D�t������D��
�\)$*�����W*�t�t�R��JrS:�J��#5c�Z��� ߯>������ �cG��o��外�_X+k"D�v����r:�XL���7�	u�2b'! �� Y����͊J����0{��C��W̙�%�F���r���[ku�]��U����X-*�Wh���؋� �]������[1�!K4.Z=��q6�[49��G�o�3vF<5Vyz�&k�����~�_���;��j�x�jT�Ñd���B��v�j��P��T&��1��#�����5�ELh�l�_�E�55J>�*�~$�u�Z��ح�2\_ϋ��9���V�����E�i0��"��r)�1&����o��-�PjEu���ӧf�/���5#���V^�I�=nP�r]��bR�1�f=���g�@�5y�*�?6����à���E�wiqZ��/ڮ/���76�!\�UShbP����*2�q�Q|]]=3<U�5ч��;(	�-Vi�]z���_n�r�SPV���!p8��Q]S�pմ\��d��fB�K�@c�L�)l������c���٪�涽�ש���"g�F��eY���MC�`l�!Q�Ɩb)�k�aF4E��p	�)yl3����^宻/�v͹��>����C3;̑f#<TRd�^&[c���8.�[ƀ[�9�j������a�?�Ey�6��x�-�e�������!~#\�s�������Z��\�Ა����bU��Ҙx�?V��Bo_}7����ܶ�c{�f�8���*0�����F� �f�@Sˤ���B If�-V�(Y� �&%]��kf�3�S��Gb��9m��K��p�/�j{���*'�~+��S����D6ƖN�ԛ�yp:�1���qM[�S�[�^j=�w�#�޶���5�߈�<Qt�Z��p��"bIXhX"+}a��1��1���b&�����Q��Z��|����}��ѕ��+�}��!'�ɜDj��l�]B(O��/F%(�6�����Pq\�a���H�s��_3�?��x�9!x���D^�5Ѥ�S�����[�!9�l�p�oλ�(���U�����b��AZFPv8�'
��W�F"�����$j�M��=I��?�0;%il�w�|^P9����!�U><��ͩ&�C�I��)�ƒ��j�H�󐍲�C��mŕT������p!��#\t�X�H籭U�]pi9rZo�7�M`]N\�3Z+3�ǣlQ�|�����\�Fg�mgO��@����)����p!I
��i��5X��.�9nR�?��@M4�Y�����~b��<V�Ovy:�����l:��t}zb[ ;�*E���y8.eES��������DM�;fG���s	��c��*�������-]��~z��a�Wa�����'<�KdUmCF�i�����&j%���FdAa\�
2�e���-��{{5��|>5:j��}�F�7�jNH�9abCAu}��@�ȱ�:�?���B\�l���z=ᆣ�v��b}��vS�y���t{�	�QQ§��6CF�ߤ�NiԄ#�v�4ܱ��a�d�v��_W����x��^�]Y�חyj�ԯ/�o�.32l�p�̈z��s���2d�T��+|�L�)h (�P]�	5�1����wm��5u)*Ƨ�ʬ
��+yxn�� w�55k%!qOD��E�%������F)T��F<�k�ʳ	�t=���y�w�D���'�Pۊ���	�̈�6q�U�O���p-�m$�^ǌ������o����f~
.�ƨ�Θ��:�a�%"�uRy��L�����#g ^�I�p�W�1��i��ywX-�u��7������&Y4�M�&+:�j�����6�pR=cp�����!��YJn�j������A�Lɩ���5u��p��K~��ü^7����o+��Y��t)�m��dބT�o1�YM �8i%�yp" m��kV[P{��C�eI�Ƅ���k�A�ʌ����K�W��z.���yQ�3<$d3'�̓�C�^�Vd�i2�7�(*�EV'A9�ҠA��	6�������	3����Z�F)d��O���WW[u=��mi֎N��j���i+���N�CvG+Wܐ�����Wۀ�"�i�=�P�DM�(�|h��-\M��XK�od{��}�SwX�<>��O��P\$L6e�;%�Q�*3�����0��1�	7|��$���x��J�0�5�����pf���u�K��s�@� *�2ęPD���|�(��ʚl%\�����(Djي��IU�O��/\��A��,5�O��>mN�y���������O~2Z��G��H9���q��/���0�l𳆇�ȁ3)���WpW�_WWə6So�	���0���s��޻{w���5�v??7G��Qq��t>FXM�S��^�M�!e�٢�����M��@_�������V����k+�]=lz��z쟃k����$���S�>_s�����d2�?���.      �      x������ � �      �      x������ � �      �   �   x����J�PF뛧�L��?�;�D#�YdY��?Laa]ٷw��J��:_q��@V|I)�GG��p��6[%gc�z �-�i �w�'cv-�\���]��]ֳ�mm�}{oO��ק]�vY�!s�oj��xxx���xw��G3��oŁ�H�P{@�*Y2U&�>��p��UY��PJb����"zI7o.��3#��I�������C�`;�8
�V?�o��$��ԼtM�|�s,      �   �  x��VKn,�\K���H�̬�mx1�aِ۫I��GpԛQk��i@h@��bd��ch&�,�lݵ�����N]�3m�k�7�>�_���C�*�ۯ���?~�����>�Egj����m'���m����7_m�YVdw�[��b���Mc��Վq�����zJk�HoU����T��q	]j�n�?1��٣�`�E&�g�|��l��UoL[��\��cpm��I%��ד�ީ��Y��aO]ˠ���Z��5:��D��rV��iH�OL����,��p��}XiA[Y|����a��K-�Cp�W�[!�;f̺��ϵO��Ebt�>*��ҺZV���>(.�����,Պ�o���ƄSu��nzӰa�- ��'����)�F����Ϙj�j��?j��ra�ׂ߭"vFc�4;U6h�2�%t����~h�Hٙ��}T�	�mo�Ѹ�=YZ�6A�*0e�t6��A�[T��1y�ؤ��C�fe��;m$����:K��ּ�'&�q�%�o�` E(��u�����tA�:B�:�D��=m�u�/����"}�6oO�zc�G[����V '�@��x1�����M ����6�y�aF=M��RW��)�OL�,7O�� �s��jb����ĺ�Cq��UF�q4��;���Ph%w�'|Q�:$�&�*&����.���C�M->1MБ��h��b�_�Y՗	���FT)�\U���Qs�j��y�Ib����j�h+6��&�o�����\&�/�����2� �ּ��Q��:��ֆF!�_� ��
m�����Ɂ%a��`p=�љ����q�o�����C*	=[�Y�:�8s1�S ��ZZ��P�ҷ��QM?{������U{�i��#�����xv�N�����Y�k )���FI��Z_��� B�j�{TT/v��iv��gO����������_�����������l���Ӈ�sޙ��7���(��wP�\0�n��}+9�+��'ϒ�5d��帣++����ǚ̓��^����K	ˠ�1\vmH�k?����a��)�b�f p������ &B��@��y��M�6�]��N�5���@��%gz)?\��?�A�Ec���й���Z�����z�e"py�����*�N��k'�{�����ZP6��]gY�+����D�W�>�e���x�����      �   �  x���Mj\A�מS��V���[��}o�&x�ϑe�:��s�Ȑ!�'4�����J�H�8v��x�	g�ɡ���!1� $K�[��d%�������1������3��xp��� �����aiG�e���:�k`�F�ZIs�7f�a��J�`�$o�#H�R��	��
L#B5��Z+�%���:M��R�F��������ƹW�8�����!9U?^�-��~<-����_�����%\� l=ƦQ$��	R�!̒����[��%�d����%�T�!����l�Qr��C�T�U����+izXXa�2�{P�0EJ3�;�s3ݒ�!�C^���G����+`�����2�1Y�q�>6�G.exG�q��f��$�ڹ�3��6�ɂ\������*.����v�7����63�<g�?����C�;�F�|�Y覆�yi����?=|����u�����@      �   �  x���K��8�|
_�rU�]�$�"L��!Eʒ[�ݔڶr����a�s��ɰ_Iw�W�$����E+yA@�!1�k�Ai�n�p7��w�����4�j�Iq,��p������M����f�t{����cpa�`�t1;'�p��m=���f:��q�vC�)�	��S|��ϟ�}���h��y�����RXp��:Q3Q{��4��7���jـo�����5��c%�4`�cŏ���=�p8u�/3�m%�]*� k��4\.C��f��i�v;��E�R�7/��лޡ���l�d<j�Eμ%�d];-*ac�ʷT^�*���1X����5�J�J�+\Y��x>Iَx�s>ݞ&�M	Ǣ�}x@���C�%�DP�e9T�D�9];&�rA�h��+�R@k�*Ai(��)�"s{mi�k�[O��ƾ=Sڝ�#^n���|J�~�P.�""e�c*��`�,hd*fA�T�,,P)�%����eU�? 1_�Ϳ&��F34q7�u.��r{.Ƨ��UU�HqI���X�������yP��y���^f�xK�����"�\T|�(K)�u�mu��6ws��._4]ڿ�Fz��LIҒ���sU2Q1�:Zo=���*��/*r�Pr��sU^UUU +�%��yMW�����/�,ӥ~�ÿ�S��N��ca	�F��>�(=0�@d�����)��Ш՟�j��x)�      �   y  x��X�jd�|V�~��Uy����`��◺b?-ذ猪f4jiv��B$U��ʌ��l�V[Z�
���N��5"���C��QH�H�*ze9�(Q~���_?��|$��)_��DI�R���3g�}�K+x̴Т��9yS�՛<�4��W>C˳��]m*q��l9K� u��j�V���USl�p�k*G�ٞ�WG��5�#SԬ?|���C�q����L�Z��]� �~�kw���R��Y�xQ0��gN��"�˟���s�k�ޣv���Cx�6В��FO�K��8,�!=�R��\G�q'N�Q���i�!��Q��?�c~����>������
]��EHo�(C��!!O�4sh�r�ޫq%e�Q����>;�>�6p��A�t�*v�lǜx��F�)�ڻ�fe���#��ү�~9xv.�@|
�, "I��<Cn����P��s2�4�z?�����D��m�Q��K��#�+ a�Y)=�^F�)^҃Y��0*�e
T<�1�B�SC�6�y�1�\��0nfg�+.�
�>:�*��r��Fh���N3nw�~��J�0'Mo#xJ4���B��6b������D�]rJ+�0gD��Ho5Tu_��B�/p�t��ҡ�ў3*wq1�Y����t��i��'�p�p�hY1���A��B+��yqY����BQ �˒��Kq{�t%�F9�d�g�;Ŋ���5A���t��������i��e���L���8y)�9���'O�q+����|'s8�$W�8u8�#�a>�8�lD:@��GZ�H[�ѯ�i��
�\#�Z�%��^<L��â�d��b�/˚��	D���DcHd}ę��]FI�Xa��NR�l2f/ӈ��/4Ȭ�;�z���T�S�OU[�#Q�@`��J�:���Yb{������G�?��U�pWǅu.��e�P�x�YS��=��4C����Zk �l:٫���]��>}��-���>$s�!��pm�1�a����J����bm�*�� �c]�@J��F���}Ґ�t�}���7�)o$O�y�5N���K*��u�4�q� ���D�7�C��y���ƙ`'�k�B!h8�����ht����&Ƿ�1�Z�� ~!����B�z�KH=ﱨ�����g��ʚ���5_$!�^�:��3.�ᅐi����B,�n]�u��xIޗ! 9���տE��uGA��	H� N[??���{'�N#j��:8b����uR�l��0l%�򚒕/	I���)��C�T���'�hl[��]h���9!�e�[�r}��Q�����7֨��S�Y��0n����ݪP{J-�ּ�1�
k2���L��%��� ��ca_�8�A����[]�y�����/��;q����{!wJ��QF?�'�U�q˞��Ҿ�S-�Q}4���ֻK�{RɖQ�_<,f��5>�$x���n��e�a��ֱ��NCw����}C��Z�ψ�>>�:rC��2�`4v���L%F
�b[v��4�Ԛ`�H�8T�V�0����D���B�\L�Z�V�<c+	�r\�-(z��e5�	Ǯ2ة�_oC�v=*D�(���8��K�O)�)��&�Xp��sJ�ȊkE�ّ��GQ!�m�"E/�xf�"��ѷ
�P�aG�{�#{�����0N~g�^i�{?��Ǔ	�.l)�J <X�^�\c���q�ˬ�h�ӀQ`BG�^W�[2*C�|'T`����BQ>��gg���jsMhY�I�P~U^1��
�j��H&v����3'��Z�dB��Mٞ8 �fCuG�7���;l&c�K�q�b�o�Tt�]#��y�X����5�
m�~ݮ����۝��U:֍�ln9�L������~�xcӎ��$�-�)���q�\�&�      �   �  x�e�M�1��ݧ�}��g�g�����G�'�%�	�G5�.Bh���m���Q��/�}Ι4Q@��Q@��&�S�d�\; G��v`	yXkg���E�����e��Ƈ�݆W�9�04,F�L]rM툝������B����v���X8^M�G��ݍ��Z�$�9��l �&�U���zg]qq��SȊ��c �fK��K�~��W���]����8#�'C�2R|��7�<�,�F��6Lw(`y��k����u����J��t�.S���
5����#H��m���A��qI6�����`;5��`�iR��<��e���ݜ�׿���6�R�Z�yU0y��K\>{FV?�u0!�X�:C�Xy���#�a|#�}X*��iB�RSoG{�q|w�CA��z�g�T(Aךub���������F      �   .   x�3���q�v�2��]|=���!_� �� �=... �      �   �  x���K�4�
�Ǚ�� �]k�	~�	�K�V�N�a�l�� �R��,���L�P�(ԧx�kL�|e�P!i]�vJ�q��}�!k׫p1�B�����y��Z�W̓7��o[iXg�1ʙ�G�^C�k�ޅ�C��bW)}p�~��=����ۦ\U�W���(㗸ڟp�U/�[��k�d+��b%ɹ�.���k�)Zz�2�Ic�R�]��f|���H�2�l����e�J*n�F��Q&2�A���4d�"g�����O���f����nKw_�!(�b�#C(4J�\#��\��Ӝv� d4c2��˷�(܏�\E����%�j5K!qG�;u���|��FN��6*sw�pB�Dv�W��y�壞UIw ���ZBu�Kq��_�x�A���mS�֣��Q�؂@��>:LR�lf��.�����W�t����u8Wcg�=�D��L7�Ŕ�L���C*�Yu���x,��W��aQ�GY?��DH��"���D�2�`��O��	�qJ��,~*�?�&�ҟ�Z�]	�c	�x����ص>��`K�̂O��h����#D�睃�r���T4����� n���^g��7��cCe*<����F�m�樘�������!���.�F'@���1B��y�Z�:�������Cp���6�6�_�?�Λ��ѩL�R�0΃�N�HE�#ʾ9�A?>A�@��P���I��	od�rÛ+*�'�r��֊�+��X{ܹۗ�}*`1��>V�RS��j�k��Go������ma��@���
g��n�T}���~���aK�xNǂ�����sM���[v)2�܊��:&"�N��]��q��.�#�]���a��a�����ƢfN6������0���:|����	��Xt)�s��C+�D��}��}���i!�8��5�+�2ox/�d���M���_͎%+W��_���ʹ|�[���1��u���u]|AH�^�������
T�      �   �  x���Is�0 �3�9�*�}�v� �^,K&��,6~}���t�t�������
�S�u� FF
x�Ē�X0�jnS�����w6?.h���|/2���ZQ���$���6:yH�e�D��B�+Y��b�!|;�v5]��p�|�O���[w;�Fa c@�V>�>��j)��=ۋ�DHR��0�0�� Q��[��Ŷ<��n}��-4��}�(�W;�|鮇Φ4�'�Q��]����Q��"_uks����HCJ�����frZ3U)��Lb���-�N;����K�#� Dn��	�R��U_�9n�6�գ���D�I	�p�@���ik�S4�ب�0��������C�)a���äbƠJ#�!��$BQ�� \��C�?�x���֗Z�,*2Ή��<��3��H�R��.�8�痄��a�ڭ�N�}����#��sO+��30a`)r�P+@�^7�G�����s�]v*���`��6��	�<w�!�ݠ�zs����a�<�y=�� ~(�f>C~u�L	��5գX�j	`�a�q��6J�(	O�I?����k+@OǙ��e	'�[[�:�2\	��í����e~z�_�a/|ڼ��m���ԧ"α"�T�Q*\b@�T{N�DZuI����e����b�~c��TC����_��&��%Us�����\vO��5�Mgf1z�8�,#�&�Τy�쯽VO��3(\��A����U�      �   �   x��˭ �K/^%���]��Kx�������>	�9�^I~��G:��in]�SE �>��`�����ة��aZ�_^�NJ|4>������y<���Hh/AF��k�bר�-DC<C��d,*ɨ�H>e��b:��z�I�K�����Ӵ�F�_��g��;j�9'�
��Kyn���?��C�     