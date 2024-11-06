PGDMP                  
    |            coba    16.4    16.4 M    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            O           1262    16470    coba    DATABASE     {   CREATE DATABASE coba WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE coba;
                postgres    false            �            1259    16522    admins    TABLE     3  CREATE TABLE public.admins (
    id integer NOT NULL,
    fullname character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.admins;
       public         heap    postgres    false            �            1259    16521    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public          postgres    false    223            P           0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public          postgres    false    222            �            1259    16471 
   enrollment    TABLE     `   CREATE TABLE public.enrollment (
    id_kelas integer NOT NULL,
    id_user integer NOT NULL
);
    DROP TABLE public.enrollment;
       public         heap    postgres    false            �            1259    24777    jawaban    TABLE     �   CREATE TABLE public.jawaban (
    id_jawaban integer NOT NULL,
    id_user integer NOT NULL,
    id_soal integer NOT NULL,
    jawaban text NOT NULL,
    waktu_submit timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.jawaban;
       public         heap    postgres    false            �            1259    24776    jawaban_id_jawaban_seq    SEQUENCE     �   CREATE SEQUENCE public.jawaban_id_jawaban_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jawaban_id_jawaban_seq;
       public          postgres    false    227            Q           0    0    jawaban_id_jawaban_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.jawaban_id_jawaban_seq OWNED BY public.jawaban.id_jawaban;
          public          postgres    false    226            �            1259    16474 
   kelas_ajar    TABLE     �   CREATE TABLE public.kelas_ajar (
    nama_mapel character(255) NOT NULL,
    kelas character(5) NOT NULL,
    id_kelas integer NOT NULL,
    token character(20) NOT NULL
);
    DROP TABLE public.kelas_ajar;
       public         heap    postgres    false            �            1259    16477    kelas_ajar_id_kelas_seq    SEQUENCE     �   CREATE SEQUENCE public.kelas_ajar_id_kelas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.kelas_ajar_id_kelas_seq;
       public          postgres    false    216            R           0    0    kelas_ajar_id_kelas_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.kelas_ajar_id_kelas_seq OWNED BY public.kelas_ajar.id_kelas;
          public          postgres    false    217            �            1259    16478    kuis    TABLE     �   CREATE TABLE public.kuis (
    id_kuis integer NOT NULL,
    id_kelas integer NOT NULL,
    judul_kuis character(255) NOT NULL,
    batas_waktu timestamp without time zone
);
    DROP TABLE public.kuis;
       public         heap    postgres    false            �            1259    16481    kuis_id_kuis_seq    SEQUENCE     �   CREATE SEQUENCE public.kuis_id_kuis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.kuis_id_kuis_seq;
       public          postgres    false    218            S           0    0    kuis_id_kuis_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kuis_id_kuis_seq OWNED BY public.kuis.id_kuis;
          public          postgres    false    219            �            1259    24809    materi    TABLE     �   CREATE TABLE public.materi (
    id_materi integer NOT NULL,
    id_kelas integer NOT NULL,
    nama_materi character varying(255) NOT NULL,
    nama_guru character varying(255) NOT NULL,
    file_materi character varying(255) NOT NULL
);
    DROP TABLE public.materi;
       public         heap    postgres    false            �            1259    24808    materi_id_materi_seq    SEQUENCE     �   CREATE SEQUENCE public.materi_id_materi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.materi_id_materi_seq;
       public          postgres    false    229            T           0    0    materi_id_materi_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.materi_id_materi_seq OWNED BY public.materi.id_materi;
          public          postgres    false    228            �            1259    24763    soal    TABLE     �   CREATE TABLE public.soal (
    id_soal integer NOT NULL,
    id_kuis integer NOT NULL,
    pertanyaan text NOT NULL,
    kunci_jawaban text NOT NULL
);
    DROP TABLE public.soal;
       public         heap    postgres    false            �            1259    24762    soal_id_soal_seq    SEQUENCE     �   CREATE SEQUENCE public.soal_id_soal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.soal_id_soal_seq;
       public          postgres    false    225            U           0    0    soal_id_soal_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.soal_id_soal_seq OWNED BY public.soal.id_soal;
          public          postgres    false    224            �            1259    24823    user_scores    TABLE       CREATE TABLE public.user_scores (
    id integer NOT NULL,
    user_id integer NOT NULL,
    kuis_id integer NOT NULL,
    score character(1),
    CONSTRAINT user_scores_score_check CHECK ((score = ANY (ARRAY['A'::bpchar, 'B'::bpchar, 'C'::bpchar, 'D'::bpchar, 'E'::bpchar])))
);
    DROP TABLE public.user_scores;
       public         heap    postgres    false            �            1259    24822    user_scores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_scores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_scores_id_seq;
       public          postgres    false    231            V           0    0    user_scores_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_scores_id_seq OWNED BY public.user_scores.id;
          public          postgres    false    230            �            1259    16482    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    fullname character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    password text NOT NULL,
    email character varying(100) NOT NULL,
    role character varying(10) NOT NULL,
    nisn_or_nuptk character varying(50),
    is_accepted boolean DEFAULT false,
    CONSTRAINT users_check CHECK (((((role)::text = 'student'::text) AND (nisn_or_nuptk IS NOT NULL)) OR (((role)::text = 'teacher'::text) AND (nisn_or_nuptk IS NOT NULL)) OR ((role IS NULL) AND (nisn_or_nuptk IS NULL)))),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY (ARRAY[('student'::character varying)::text, ('teacher'::character varying)::text])))
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16489    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    220            W           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    221            {           2604    16525 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            ~           2604    24780    jawaban id_jawaban    DEFAULT     x   ALTER TABLE ONLY public.jawaban ALTER COLUMN id_jawaban SET DEFAULT nextval('public.jawaban_id_jawaban_seq'::regclass);
 A   ALTER TABLE public.jawaban ALTER COLUMN id_jawaban DROP DEFAULT;
       public          postgres    false    226    227    227            w           2604    16536    kelas_ajar id_kelas    DEFAULT     z   ALTER TABLE ONLY public.kelas_ajar ALTER COLUMN id_kelas SET DEFAULT nextval('public.kelas_ajar_id_kelas_seq'::regclass);
 B   ALTER TABLE public.kelas_ajar ALTER COLUMN id_kelas DROP DEFAULT;
       public          postgres    false    217    216            x           2604    16491    kuis id_kuis    DEFAULT     l   ALTER TABLE ONLY public.kuis ALTER COLUMN id_kuis SET DEFAULT nextval('public.kuis_id_kuis_seq'::regclass);
 ;   ALTER TABLE public.kuis ALTER COLUMN id_kuis DROP DEFAULT;
       public          postgres    false    219    218            �           2604    24812    materi id_materi    DEFAULT     t   ALTER TABLE ONLY public.materi ALTER COLUMN id_materi SET DEFAULT nextval('public.materi_id_materi_seq'::regclass);
 ?   ALTER TABLE public.materi ALTER COLUMN id_materi DROP DEFAULT;
       public          postgres    false    229    228    229            }           2604    24766    soal id_soal    DEFAULT     l   ALTER TABLE ONLY public.soal ALTER COLUMN id_soal SET DEFAULT nextval('public.soal_id_soal_seq'::regclass);
 ;   ALTER TABLE public.soal ALTER COLUMN id_soal DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    24826    user_scores id    DEFAULT     p   ALTER TABLE ONLY public.user_scores ALTER COLUMN id SET DEFAULT nextval('public.user_scores_id_seq'::regclass);
 =   ALTER TABLE public.user_scores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            y           2604    16492    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            A          0    16522    admins 
   TABLE DATA           U   COPY public.admins (id, fullname, username, password, email, created_at) FROM stdin;
    public          postgres    false    223   /Z       9          0    16471 
   enrollment 
   TABLE DATA           7   COPY public.enrollment (id_kelas, id_user) FROM stdin;
    public          postgres    false    215   �Z       E          0    24777    jawaban 
   TABLE DATA           V   COPY public.jawaban (id_jawaban, id_user, id_soal, jawaban, waktu_submit) FROM stdin;
    public          postgres    false    227   �Z       :          0    16474 
   kelas_ajar 
   TABLE DATA           H   COPY public.kelas_ajar (nama_mapel, kelas, id_kelas, token) FROM stdin;
    public          postgres    false    216   [       <          0    16478    kuis 
   TABLE DATA           J   COPY public.kuis (id_kuis, id_kelas, judul_kuis, batas_waktu) FROM stdin;
    public          postgres    false    218   U[       G          0    24809    materi 
   TABLE DATA           Z   COPY public.materi (id_materi, id_kelas, nama_materi, nama_guru, file_materi) FROM stdin;
    public          postgres    false    229   �[       C          0    24763    soal 
   TABLE DATA           K   COPY public.soal (id_soal, id_kuis, pertanyaan, kunci_jawaban) FROM stdin;
    public          postgres    false    225   �[       I          0    24823    user_scores 
   TABLE DATA           B   COPY public.user_scores (id, user_id, kuis_id, score) FROM stdin;
    public          postgres    false    231   �\       >          0    16482    users 
   TABLE DATA           j   COPY public.users (id, fullname, username, password, email, role, nisn_or_nuptk, is_accepted) FROM stdin;
    public          postgres    false    220   �\       X           0    0    admins_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.admins_id_seq', 1, true);
          public          postgres    false    222            Y           0    0    jawaban_id_jawaban_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jawaban_id_jawaban_seq', 20, true);
          public          postgres    false    226            Z           0    0    kelas_ajar_id_kelas_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.kelas_ajar_id_kelas_seq', 15, true);
          public          postgres    false    217            [           0    0    kuis_id_kuis_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kuis_id_kuis_seq', 22, true);
          public          postgres    false    219            \           0    0    materi_id_materi_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.materi_id_materi_seq', 1, false);
          public          postgres    false    228            ]           0    0    soal_id_soal_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.soal_id_soal_seq', 18, true);
          public          postgres    false    224            ^           0    0    user_scores_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_scores_id_seq', 1, false);
          public          postgres    false    230            _           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 18, true);
          public          postgres    false    221            �           2606    16534    admins admins_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key;
       public            postgres    false    223            �           2606    16530    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    223            �           2606    16532    admins admins_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_username_key UNIQUE (username);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_username_key;
       public            postgres    false    223            �           2606    16494    enrollment enrollment_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (id_kelas, id_user);
 D   ALTER TABLE ONLY public.enrollment DROP CONSTRAINT enrollment_pkey;
       public            postgres    false    215    215            �           2606    24784    jawaban jawaban_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.jawaban
    ADD CONSTRAINT jawaban_pkey PRIMARY KEY (id_jawaban);
 >   ALTER TABLE ONLY public.jawaban DROP CONSTRAINT jawaban_pkey;
       public            postgres    false    227            �           2606    16496    kelas_ajar kelas_ajar_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.kelas_ajar
    ADD CONSTRAINT kelas_ajar_pkey PRIMARY KEY (id_kelas);
 D   ALTER TABLE ONLY public.kelas_ajar DROP CONSTRAINT kelas_ajar_pkey;
       public            postgres    false    216            �           2606    16498    kuis kuis_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.kuis
    ADD CONSTRAINT kuis_pkey PRIMARY KEY (id_kuis);
 8   ALTER TABLE ONLY public.kuis DROP CONSTRAINT kuis_pkey;
       public            postgres    false    218            �           2606    24816    materi materi_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.materi
    ADD CONSTRAINT materi_pkey PRIMARY KEY (id_materi);
 <   ALTER TABLE ONLY public.materi DROP CONSTRAINT materi_pkey;
       public            postgres    false    229            �           2606    24770    soal soal_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.soal
    ADD CONSTRAINT soal_pkey PRIMARY KEY (id_soal);
 8   ALTER TABLE ONLY public.soal DROP CONSTRAINT soal_pkey;
       public            postgres    false    225            �           2606    24829    user_scores user_scores_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_scores
    ADD CONSTRAINT user_scores_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_scores DROP CONSTRAINT user_scores_pkey;
       public            postgres    false    231            �           2606    24831 +   user_scores user_scores_user_id_kuis_id_key 
   CONSTRAINT     r   ALTER TABLE ONLY public.user_scores
    ADD CONSTRAINT user_scores_user_id_kuis_id_key UNIQUE (user_id, kuis_id);
 U   ALTER TABLE ONLY public.user_scores DROP CONSTRAINT user_scores_user_id_kuis_id_key;
       public            postgres    false    231    231            �           2606    16500    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    220            �           2606    16502    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    16504    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    220            �           2606    16505    enrollment id_kelas    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT id_kelas FOREIGN KEY (id_kelas) REFERENCES public.kelas_ajar(id_kelas) NOT VALID;
 =   ALTER TABLE ONLY public.enrollment DROP CONSTRAINT id_kelas;
       public          postgres    false    216    4744    215            �           2606    16510    kuis id_kelas    FK CONSTRAINT     x   ALTER TABLE ONLY public.kuis
    ADD CONSTRAINT id_kelas FOREIGN KEY (id_kelas) REFERENCES public.kelas_ajar(id_kelas);
 7   ALTER TABLE ONLY public.kuis DROP CONSTRAINT id_kelas;
       public          postgres    false    218    216    4744            �           2606    16515    enrollment id_user    FK CONSTRAINT     q   ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 <   ALTER TABLE ONLY public.enrollment DROP CONSTRAINT id_user;
       public          postgres    false    220    4750    215            �           2606    24790    jawaban jawaban_id_soal_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.jawaban
    ADD CONSTRAINT jawaban_id_soal_fkey FOREIGN KEY (id_soal) REFERENCES public.soal(id_soal);
 F   ALTER TABLE ONLY public.jawaban DROP CONSTRAINT jawaban_id_soal_fkey;
       public          postgres    false    4760    225    227            �           2606    24785    jawaban jawaban_id_user_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.jawaban
    ADD CONSTRAINT jawaban_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.jawaban DROP CONSTRAINT jawaban_id_user_fkey;
       public          postgres    false    227    4750    220            �           2606    24817    materi materi_id_kelas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materi
    ADD CONSTRAINT materi_id_kelas_fkey FOREIGN KEY (id_kelas) REFERENCES public.kelas_ajar(id_kelas) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.materi DROP CONSTRAINT materi_id_kelas_fkey;
       public          postgres    false    4744    216    229            �           2606    24771    soal soal_id_kuis_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.soal
    ADD CONSTRAINT soal_id_kuis_fkey FOREIGN KEY (id_kuis) REFERENCES public.kuis(id_kuis);
 @   ALTER TABLE ONLY public.soal DROP CONSTRAINT soal_id_kuis_fkey;
       public          postgres    false    218    225    4746            �           2606    24837 $   user_scores user_scores_kuis_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_scores
    ADD CONSTRAINT user_scores_kuis_id_fkey FOREIGN KEY (kuis_id) REFERENCES public.kuis(id_kuis);
 N   ALTER TABLE ONLY public.user_scores DROP CONSTRAINT user_scores_kuis_id_fkey;
       public          postgres    false    4746    231    218            �           2606    24832 $   user_scores user_scores_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_scores
    ADD CONSTRAINT user_scores_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.user_scores DROP CONSTRAINT user_scores_user_id_fkey;
       public          postgres    false    220    231    4750            A   E   x�3�LL��̃�ũ9�F��CjEbnAN�^r~.��������������������������1W� ���      9      x�34�44�2�f\1z\\\ Hd      E   b   x���A
�  ���+�@�n릾����t��x��m@
䡶v���X�ũ!�dM�V"�0R�A��8�W�Kjb�����0r��K�[�'�      :   (   x�K���MU���� L�rZ�&��Y"d�b���� s&�      <   j   x��ӱ�0D�:�"�l��g������KAAL��?��I��P�rl���Z+�"-�]ՙI����Q��*�^�^�G�9����#����e扈N汘q      G      x������ � �      C   �   x�m�;n1Dk�:�m�g0�H�fl^b��B�·/��9 �f��D�*�z[�~㕋ioXᡲ�W��2�ą�a����u^hz��� �Iꃤ�k+h���"{֗��>3��y��}�pᕦ@���_v8�݁�h�ha�E��qYQ���d���� ?G��+[�_9!u�(3o�}�u��"av�����a~      I      x������ � �      >     x�u��N�1���#k���
h�6�%T�x�q���H����.�/���|fн�����c�x��%��ܙC���}<���z��V6��5���$:	%`��ރpi{h�Ӫ�2��>��l���4=]�2�gy�lqʳ&Hl�]lW�Lguz<�x��������>+A_(cb�*^]�,Z"Y�d�՘�e/�D	� D�Ճ����M���:&<��n�t��o�i�:����5������M���k�"N�@
Ԩ�,rp�mB΍�X�5d!���Zn�˛�����j����]�A�^u��a9u�x7??��ëOv���,�L0�3�\b��	2F�bt�0)�FV�=�E�?b�k�\��׬��|������n��lx�s6ټLn��İ����H�N ���wR�fQ������M�CM����8k����*�fi��	�ұȎs�N��~�_q��f{�G�/&����!������&�����h��jK��*siAT��r�|���^��&��     