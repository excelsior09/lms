PGDMP      $                |            lms    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397    lms    DATABASE     ~   CREATE DATABASE lms WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE lms;
                postgres    false            �            1259    16413 
   kelas_ajar    TABLE     �   CREATE TABLE public.kelas_ajar (
    nama_mapel character(255) NOT NULL,
    kelas character(5) NOT NULL,
    id_kelas integer NOT NULL,
    token character(20) NOT NULL
);
    DROP TABLE public.kelas_ajar;
       public         heap    postgres    false            �            1259    16473    kelas_ajar_id_kelas_seq    SEQUENCE     �   CREATE SEQUENCE public.kelas_ajar_id_kelas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.kelas_ajar_id_kelas_seq;
       public          postgres    false    217            �           0    0    kelas_ajar_id_kelas_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.kelas_ajar_id_kelas_seq OWNED BY public.kelas_ajar.id_kelas;
          public          postgres    false    219            ^           2604    16474    kelas_ajar id_kelas    DEFAULT     z   ALTER TABLE ONLY public.kelas_ajar ALTER COLUMN id_kelas SET DEFAULT nextval('public.kelas_ajar_id_kelas_seq'::regclass);
 B   ALTER TABLE public.kelas_ajar ALTER COLUMN id_kelas DROP DEFAULT;
       public          postgres    false    219    217            �          0    16413 
   kelas_ajar 
   TABLE DATA           H   COPY public.kelas_ajar (nama_mapel, kelas, id_kelas, token) FROM stdin;
    public          postgres    false    217          �           0    0    kelas_ajar_id_kelas_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.kelas_ajar_id_kelas_seq', 8, true);
          public          postgres    false    219            `           2606    16479    kelas_ajar kelas_ajar_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.kelas_ajar
    ADD CONSTRAINT kelas_ajar_pkey PRIMARY KEY (id_kelas);
 D   ALTER TABLE ONLY public.kelas_ajar DROP CONSTRAINT kelas_ajar_pkey;
       public            postgres    false    217            �   %   x��V���LZp�&�����!$�b���� U_&     