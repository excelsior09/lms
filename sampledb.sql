PGDMP      
                |            coba    16.4    16.4 C    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    16470    coba    DATABASE     {   CREATE DATABASE coba WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
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
       public          postgres    false    223            A           0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public          postgres    false    222            �            1259    16471 
   enrollment    TABLE     `   CREATE TABLE public.enrollment (
    id_kelas integer NOT NULL,
    id_user integer NOT NULL
);
    DROP TABLE public.enrollment;
       public         heap    postgres    false            �            1259    24777    jawaban    TABLE     	  CREATE TABLE public.jawaban (
    id_jawaban integer NOT NULL,
    id_user integer NOT NULL,
    id_soal integer NOT NULL,
    jawaban text NOT NULL,
    waktu_submit timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    nilai character varying(1)
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
       public          postgres    false    227            B           0    0    jawaban_id_jawaban_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.jawaban_id_jawaban_seq OWNED BY public.jawaban.id_jawaban;
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
       public          postgres    false    216            C           0    0    kelas_ajar_id_kelas_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.kelas_ajar_id_kelas_seq OWNED BY public.kelas_ajar.id_kelas;
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
       public          postgres    false    218            D           0    0    kuis_id_kuis_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.kuis_id_kuis_seq OWNED BY public.kuis.id_kuis;
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
       public          postgres    false    229            E           0    0    materi_id_materi_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.materi_id_materi_seq OWNED BY public.materi.id_materi;
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
       public          postgres    false    225            F           0    0    soal_id_soal_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.soal_id_soal_seq OWNED BY public.soal.id_soal;
          public          postgres    false    224            �            1259    16482    users    TABLE     �  CREATE TABLE public.users (
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
       public          postgres    false    220            G           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    221            v           2604    16525 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            y           2604    24780    jawaban id_jawaban    DEFAULT     x   ALTER TABLE ONLY public.jawaban ALTER COLUMN id_jawaban SET DEFAULT nextval('public.jawaban_id_jawaban_seq'::regclass);
 A   ALTER TABLE public.jawaban ALTER COLUMN id_jawaban DROP DEFAULT;
       public          postgres    false    227    226    227            r           2604    16536    kelas_ajar id_kelas    DEFAULT     z   ALTER TABLE ONLY public.kelas_ajar ALTER COLUMN id_kelas SET DEFAULT nextval('public.kelas_ajar_id_kelas_seq'::regclass);
 B   ALTER TABLE public.kelas_ajar ALTER COLUMN id_kelas DROP DEFAULT;
       public          postgres    false    217    216            s           2604    16491    kuis id_kuis    DEFAULT     l   ALTER TABLE ONLY public.kuis ALTER COLUMN id_kuis SET DEFAULT nextval('public.kuis_id_kuis_seq'::regclass);
 ;   ALTER TABLE public.kuis ALTER COLUMN id_kuis DROP DEFAULT;
       public          postgres    false    219    218            {           2604    24812    materi id_materi    DEFAULT     t   ALTER TABLE ONLY public.materi ALTER COLUMN id_materi SET DEFAULT nextval('public.materi_id_materi_seq'::regclass);
 ?   ALTER TABLE public.materi ALTER COLUMN id_materi DROP DEFAULT;
       public          postgres    false    229    228    229            x           2604    24766    soal id_soal    DEFAULT     l   ALTER TABLE ONLY public.soal ALTER COLUMN id_soal SET DEFAULT nextval('public.soal_id_soal_seq'::regclass);
 ;   ALTER TABLE public.soal ALTER COLUMN id_soal DROP DEFAULT;
       public          postgres    false    224    225    225            t           2604    16492    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            4          0    16522    admins 
   TABLE DATA           U   COPY public.admins (id, fullname, username, password, email, created_at) FROM stdin;
    public          postgres    false    223   �M       ,          0    16471 
   enrollment 
   TABLE DATA           7   COPY public.enrollment (id_kelas, id_user) FROM stdin;
    public          postgres    false    215   �M       8          0    24777    jawaban 
   TABLE DATA           ]   COPY public.jawaban (id_jawaban, id_user, id_soal, jawaban, waktu_submit, nilai) FROM stdin;
    public          postgres    false    227   :N       -          0    16474 
   kelas_ajar 
   TABLE DATA           H   COPY public.kelas_ajar (nama_mapel, kelas, id_kelas, token) FROM stdin;
    public          postgres    false    216   O       /          0    16478    kuis 
   TABLE DATA           J   COPY public.kuis (id_kuis, id_kelas, judul_kuis, batas_waktu) FROM stdin;
    public          postgres    false    218   qO       :          0    24809    materi 
   TABLE DATA           Z   COPY public.materi (id_materi, id_kelas, nama_materi, nama_guru, file_materi) FROM stdin;
    public          postgres    false    229   /P       6          0    24763    soal 
   TABLE DATA           K   COPY public.soal (id_soal, id_kuis, pertanyaan, kunci_jawaban) FROM stdin;
    public          postgres    false    225   LP       1          0    16482    users 
   TABLE DATA           j   COPY public.users (id, fullname, username, password, email, role, nisn_or_nuptk, is_accepted) FROM stdin;
    public          postgres    false    220   YQ       H           0    0    admins_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.admins_id_seq', 1, true);
          public          postgres    false    222            I           0    0    jawaban_id_jawaban_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jawaban_id_jawaban_seq', 24, true);
          public          postgres    false    226            J           0    0    kelas_ajar_id_kelas_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.kelas_ajar_id_kelas_seq', 16, true);
          public          postgres    false    217            K           0    0    kuis_id_kuis_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kuis_id_kuis_seq', 26, true);
          public          postgres    false    219            L           0    0    materi_id_materi_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.materi_id_materi_seq', 1, false);
          public          postgres    false    228            M           0    0    soal_id_soal_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.soal_id_soal_seq', 22, true);
          public          postgres    false    224            N           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 39, true);
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
       public            postgres    false    223                       2606    16494    enrollment enrollment_pkey 
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
       public            postgres    false    225            �           2606    16500    users users_email_key 
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
       public          postgres    false    4737    215    216            �           2606    16510    kuis id_kelas    FK CONSTRAINT     x   ALTER TABLE ONLY public.kuis
    ADD CONSTRAINT id_kelas FOREIGN KEY (id_kelas) REFERENCES public.kelas_ajar(id_kelas);
 7   ALTER TABLE ONLY public.kuis DROP CONSTRAINT id_kelas;
       public          postgres    false    216    218    4737            �           2606    16515    enrollment id_user    FK CONSTRAINT     q   ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 <   ALTER TABLE ONLY public.enrollment DROP CONSTRAINT id_user;
       public          postgres    false    220    4743    215            �           2606    24790    jawaban jawaban_id_soal_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.jawaban
    ADD CONSTRAINT jawaban_id_soal_fkey FOREIGN KEY (id_soal) REFERENCES public.soal(id_soal);
 F   ALTER TABLE ONLY public.jawaban DROP CONSTRAINT jawaban_id_soal_fkey;
       public          postgres    false    4753    227    225            �           2606    24785    jawaban jawaban_id_user_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.jawaban
    ADD CONSTRAINT jawaban_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.jawaban DROP CONSTRAINT jawaban_id_user_fkey;
       public          postgres    false    220    4743    227            �           2606    24817    materi materi_id_kelas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materi
    ADD CONSTRAINT materi_id_kelas_fkey FOREIGN KEY (id_kelas) REFERENCES public.kelas_ajar(id_kelas) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.materi DROP CONSTRAINT materi_id_kelas_fkey;
       public          postgres    false    4737    229    216            �           2606    24771    soal soal_id_kuis_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.soal
    ADD CONSTRAINT soal_id_kuis_fkey FOREIGN KEY (id_kuis) REFERENCES public.kuis(id_kuis);
 @   ALTER TABLE ONLY public.soal DROP CONSTRAINT soal_id_kuis_fkey;
       public          postgres    false    225    218    4739            4   E   x�3�LL��̃�ũ9�F��CjEbnAN�^r~.��������������������������1W� ���      ,   H   x�̱�0�à���^��%h��y���e�~�B�*��x#E�І6��mhC�,����r�      8   �   x���KJ1E�/��:�_RIf~Ʈ�'�th��ܽ�RTE��s8�&� �an����j�Z���Dt�`	�JVv�8(í�x(��ʽ�t(\��`Cfr*��Ýa<�[�e���1L�ॖ���7��˺�~5H,b�%9��}����Fc�;L��gd�2�'8?��2Z���ا�\���h1f��wE���|(���q�HNd
�w��1o��Y6      -   E   x�K���MU���� L�rZ�&��Y"d��s�q8-���0t,�SL��\1z\\\ `PL�      /   �   x���M� ��5�b.P3?P���aQ��j��O*�B���{�/O`(�&�����f�5� �"�2V�^�U�r��,CUF�j�#"}d��8�j-2Ԑ˿i��,���.p�Q{�BU��;���8���=P�*�����~��+����"�x�ʴ+����?�e�;k�ô2�      :      x������ � �      6   �   x���KN�0���)| ��� [6��i��i�ǂ��ЎFB]�H,���߶݁}���Z�8��Ic-4R��1R�e�%�oO�C������5�5H��j.�ʔ�S���[d|�0�ȥ�4����#8��Hݻ��7�Gp�4z�:is��J�Ǡ�d�S_[W%G*�O�́B�े�E�����)PotS��Y��	�$�W��_���I��I�Fo���R�v�m��t���$���nW�W��1��_��      1   �  x��VMS�8=�_�g��-�[6XB��}�g<x��d��e���=��R�{~j=�Yr[X�U��q;א�K�,�S,����q�?h�~N�g۸n����ӽ��JS�u��L:[ν3T[n�)�J-5@�f�F-��Do�������|QC�9Y�7�5�J(E������(?F��?_^�h��
^��S�Kʔ�:�Ah�G�#9n���`^F�j(�[�$��Y)'k���G�������)�3.�"�N�u�uM�}�`Nf��������Ge��j�dC�f�i9�?��q��n__ ����@�S/B���|:*�!Z\	)�Mi�Qd�u��ʙ��,X!�C�|�d�P?�*�TZ
�P�V��� ��8�r�(&���~_ܝ���S����k�BL1�P��	FR9.r�
P� �G=�0�$��ց؋`�3�%�d�<C���1N��������^�x.����/PZrǢ�A!ZS:�9U&ped�Ds2"���`C!�T������s��8#��]��:;[�����c�� ��}��������C.��53�wd���";��~����Hl��jMv��ԉ�.:�&�|�a���NV�����[VmӢ��g׈�O{�Q��թ�PM��z�~\�z<1{�<���Z��krϾl|�"!��b��	���E'd����6V[����;��`c����0����M6�4�� ��j�$��N�ޯ����q�{����x�#
d,����]Z4iȯ`���kE{�}۸���)l�Q&������(��O�zu�L���ק�:OKp�
_И�ax�G�����F)oJ�a���3)#��޹Pto�e�.��3���%�.$����7'OK��P�S1K�p��jh\v�L��]g����oH꾦������\�ΊM�Y�����Iκ�P���-�^�R)F~���[�&�Z@�ڬ�Ӑ9|���0g����u�8Ze��cUוKW�>���w���+�1&]�@I��}�2�S�VE��2��u�2!ɷ�	��>òA?����C�!�O_���Q�c��9���$��:}�����$n[����N<�����zޒ�%u(��ʛa��
kf�ۊ�\op!�Ě��^��g0Jޒ��{Zj�}�!�K7�Ľ�n7k,��C��L�H�Y�Qu}g���Ȯ[H����nKa>�ǵ���X�����_�!�     