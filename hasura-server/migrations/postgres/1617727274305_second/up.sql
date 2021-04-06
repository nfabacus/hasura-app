CREATE TABLE public.address (
    id uuid NOT NULL,
    street text,
    zip text,
    city text,
    country text,
    author_id integer
);
CREATE TABLE public.comments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    comment text NOT NULL,
    photo_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    description character varying(200),
    created_at timestamp without time zone DEFAULT now(),
    updatedat timestamp without time zone DEFAULT now()
);
CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
CREATE TABLE public.photos (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    photo_url text NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.photos IS 'This is all photos  updated by users';
CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    updatedat timestamp without time zone DEFAULT now()
);
CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    avatarurl character varying(200),
    email character varying(30) NOT NULL,
    password character varying(200) NOT NULL,
    accountconfirmed boolean DEFAULT false NOT NULL,
    accountconfirmationtoken character varying(20),
    confirmationtokenexpires timestamp without time zone,
    resetpasswordtoken character varying(20),
    resetpasswordexpires timestamp without time zone,
    createdat timestamp without time zone DEFAULT now(),
    updatedat timestamp without time zone DEFAULT now()
);
CREATE TABLE public.users_groups (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
CREATE TABLE public.users_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);
ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);
ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_pkey PRIMARY KEY (user_id, group_id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.photos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);
ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
