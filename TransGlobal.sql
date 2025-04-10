PGDMP                      }           postgres    17.4    17.4 @    j           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            k           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            l           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            m           1262    5    postgres    DATABASE     n   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'it-IT';
    DROP DATABASE postgres;
                     postgres    false            n           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4973                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            o           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    19216    mezzo    TABLE     =  CREATE TABLE public.mezzo (
    id_mezzo integer NOT NULL,
    tipo character varying(20) NOT NULL,
    capacita integer,
    CONSTRAINT mezzo_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Treno'::character varying, 'Aereo'::character varying, 'Nave'::character varying, 'Autobus'::character varying])::text[])))
);
    DROP TABLE public.mezzo;
       public         heap r       postgres    false    4            �            1259    19215    mezzo_id_mezzo_seq    SEQUENCE     �   CREATE SEQUENCE public.mezzo_id_mezzo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.mezzo_id_mezzo_seq;
       public               postgres    false    4    220            p           0    0    mezzo_id_mezzo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.mezzo_id_mezzo_seq OWNED BY public.mezzo.id_mezzo;
          public               postgres    false    219            �            1259    19224 
   passeggero    TABLE     �   CREATE TABLE public.passeggero (
    id_passeggero integer NOT NULL,
    nome character varying(100) NOT NULL,
    cognome character varying(100) NOT NULL,
    data_nascita date,
    email character varying(100),
    telefono character varying(20)
);
    DROP TABLE public.passeggero;
       public         heap r       postgres    false    4            �            1259    19223    passeggero_id_passeggero_seq    SEQUENCE     �   CREATE SEQUENCE public.passeggero_id_passeggero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.passeggero_id_passeggero_seq;
       public               postgres    false    222    4            q           0    0    passeggero_id_passeggero_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.passeggero_id_passeggero_seq OWNED BY public.passeggero.id_passeggero;
          public               postgres    false    221            �            1259    19286    scalo    TABLE     *  CREATE TABLE public.scalo (
    id_scalo integer NOT NULL,
    id_viaggio_principale integer NOT NULL,
    id_tratta_scalo integer NOT NULL,
    ora_arrivo_scalo timestamp without time zone NOT NULL,
    ora_partenza_scalo timestamp without time zone NOT NULL,
    ordine_scalo integer NOT NULL
);
    DROP TABLE public.scalo;
       public         heap r       postgres    false    4            �            1259    19285    scalo_id_scalo_seq    SEQUENCE     �   CREATE SEQUENCE public.scalo_id_scalo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.scalo_id_scalo_seq;
       public               postgres    false    229    4            r           0    0    scalo_id_scalo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.scalo_id_scalo_seq OWNED BY public.scalo.id_scalo;
          public               postgres    false    228            �            1259    19207    stazione    TABLE     �   CREATE TABLE public.stazione (
    id_stazione integer NOT NULL,
    nome_stazione character varying(255) NOT NULL,
    citta character varying(100) NOT NULL,
    nazione character varying(100) NOT NULL
);
    DROP TABLE public.stazione;
       public         heap r       postgres    false    4            �            1259    19206    stazione_id_stazione_seq    SEQUENCE     �   CREATE SEQUENCE public.stazione_id_stazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.stazione_id_stazione_seq;
       public               postgres    false    4    218            s           0    0    stazione_id_stazione_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.stazione_id_stazione_seq OWNED BY public.stazione.id_stazione;
          public               postgres    false    217            �            1259    19266    ticket    TABLE     �  CREATE TABLE public.ticket (
    codice_tckt character varying(50) NOT NULL,
    id_passeggero integer NOT NULL,
    id_viaggio integer NOT NULL,
    codice_prenotazione character varying(50) NOT NULL,
    data_emissione date DEFAULT CURRENT_DATE NOT NULL,
    prezzo_totale numeric(10,2) NOT NULL,
    classe_servizio character varying(50),
    valido boolean DEFAULT true NOT NULL
);
    DROP TABLE public.ticket;
       public         heap r       postgres    false    4            �            1259    19231    tratta    TABLE     Y  CREATE TABLE public.tratta (
    id_tratta integer NOT NULL,
    codice_tratta character varying(50) NOT NULL,
    id_stazione_partenza integer NOT NULL,
    id_stazione_arrivo integer NOT NULL,
    ora_partenza timestamp without time zone NOT NULL,
    ora_arrivo timestamp without time zone NOT NULL,
    prezzo_base numeric(10,2) NOT NULL
);
    DROP TABLE public.tratta;
       public         heap r       postgres    false    4            �            1259    19230    tratta_id_tratta_seq    SEQUENCE     �   CREATE SEQUENCE public.tratta_id_tratta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tratta_id_tratta_seq;
       public               postgres    false    4    224            t           0    0    tratta_id_tratta_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tratta_id_tratta_seq OWNED BY public.tratta.id_tratta;
          public               postgres    false    223            �            1259    19250    viaggio    TABLE       CREATE TABLE public.viaggio (
    id_viaggio integer NOT NULL,
    id_tratta integer NOT NULL,
    id_mezzo integer NOT NULL,
    data_viaggio date NOT NULL,
    ora_effettiva_partenza time without time zone,
    ora_effettiva_arrivo time without time zone
);
    DROP TABLE public.viaggio;
       public         heap r       postgres    false    4            �            1259    19249    viaggio_id_viaggio_seq    SEQUENCE     �   CREATE SEQUENCE public.viaggio_id_viaggio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.viaggio_id_viaggio_seq;
       public               postgres    false    226    4            u           0    0    viaggio_id_viaggio_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.viaggio_id_viaggio_seq OWNED BY public.viaggio.id_viaggio;
          public               postgres    false    225            �           2604    19219    mezzo id_mezzo    DEFAULT     p   ALTER TABLE ONLY public.mezzo ALTER COLUMN id_mezzo SET DEFAULT nextval('public.mezzo_id_mezzo_seq'::regclass);
 =   ALTER TABLE public.mezzo ALTER COLUMN id_mezzo DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    19227    passeggero id_passeggero    DEFAULT     �   ALTER TABLE ONLY public.passeggero ALTER COLUMN id_passeggero SET DEFAULT nextval('public.passeggero_id_passeggero_seq'::regclass);
 G   ALTER TABLE public.passeggero ALTER COLUMN id_passeggero DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    19289    scalo id_scalo    DEFAULT     p   ALTER TABLE ONLY public.scalo ALTER COLUMN id_scalo SET DEFAULT nextval('public.scalo_id_scalo_seq'::regclass);
 =   ALTER TABLE public.scalo ALTER COLUMN id_scalo DROP DEFAULT;
       public               postgres    false    228    229    229            �           2604    19210    stazione id_stazione    DEFAULT     |   ALTER TABLE ONLY public.stazione ALTER COLUMN id_stazione SET DEFAULT nextval('public.stazione_id_stazione_seq'::regclass);
 C   ALTER TABLE public.stazione ALTER COLUMN id_stazione DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    19234    tratta id_tratta    DEFAULT     t   ALTER TABLE ONLY public.tratta ALTER COLUMN id_tratta SET DEFAULT nextval('public.tratta_id_tratta_seq'::regclass);
 ?   ALTER TABLE public.tratta ALTER COLUMN id_tratta DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    19253    viaggio id_viaggio    DEFAULT     x   ALTER TABLE ONLY public.viaggio ALTER COLUMN id_viaggio SET DEFAULT nextval('public.viaggio_id_viaggio_seq'::regclass);
 A   ALTER TABLE public.viaggio ALTER COLUMN id_viaggio DROP DEFAULT;
       public               postgres    false    225    226    226            ^          0    19216    mezzo 
   TABLE DATA           9   COPY public.mezzo (id_mezzo, tipo, capacita) FROM stdin;
    public               postgres    false    220   P       `          0    19224 
   passeggero 
   TABLE DATA           a   COPY public.passeggero (id_passeggero, nome, cognome, data_nascita, email, telefono) FROM stdin;
    public               postgres    false    222   7P       g          0    19286    scalo 
   TABLE DATA           �   COPY public.scalo (id_scalo, id_viaggio_principale, id_tratta_scalo, ora_arrivo_scalo, ora_partenza_scalo, ordine_scalo) FROM stdin;
    public               postgres    false    229   �P       \          0    19207    stazione 
   TABLE DATA           N   COPY public.stazione (id_stazione, nome_stazione, citta, nazione) FROM stdin;
    public               postgres    false    218   �P       e          0    19266    ticket 
   TABLE DATA           �   COPY public.ticket (codice_tckt, id_passeggero, id_viaggio, codice_prenotazione, data_emissione, prezzo_totale, classe_servizio, valido) FROM stdin;
    public               postgres    false    227   �P       b          0    19231    tratta 
   TABLE DATA           �   COPY public.tratta (id_tratta, codice_tratta, id_stazione_partenza, id_stazione_arrivo, ora_partenza, ora_arrivo, prezzo_base) FROM stdin;
    public               postgres    false    224   Q       d          0    19250    viaggio 
   TABLE DATA           ~   COPY public.viaggio (id_viaggio, id_tratta, id_mezzo, data_viaggio, ora_effettiva_partenza, ora_effettiva_arrivo) FROM stdin;
    public               postgres    false    226   Q       v           0    0    mezzo_id_mezzo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.mezzo_id_mezzo_seq', 1, false);
          public               postgres    false    219            w           0    0    passeggero_id_passeggero_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.passeggero_id_passeggero_seq', 1, true);
          public               postgres    false    221            x           0    0    scalo_id_scalo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.scalo_id_scalo_seq', 1, false);
          public               postgres    false    228            y           0    0    stazione_id_stazione_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.stazione_id_stazione_seq', 3, true);
          public               postgres    false    217            z           0    0    tratta_id_tratta_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tratta_id_tratta_seq', 7, true);
          public               postgres    false    223            {           0    0    viaggio_id_viaggio_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.viaggio_id_viaggio_seq', 6, true);
          public               postgres    false    225            �           2606    19222    mezzo mezzo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.mezzo
    ADD CONSTRAINT mezzo_pkey PRIMARY KEY (id_mezzo);
 :   ALTER TABLE ONLY public.mezzo DROP CONSTRAINT mezzo_pkey;
       public                 postgres    false    220            �           2606    19229    passeggero passeggero_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_pkey PRIMARY KEY (id_passeggero);
 D   ALTER TABLE ONLY public.passeggero DROP CONSTRAINT passeggero_pkey;
       public                 postgres    false    222            �           2606    19293 2   scalo scalo_id_viaggio_principale_ordine_scalo_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.scalo
    ADD CONSTRAINT scalo_id_viaggio_principale_ordine_scalo_key UNIQUE (id_viaggio_principale, ordine_scalo);
 \   ALTER TABLE ONLY public.scalo DROP CONSTRAINT scalo_id_viaggio_principale_ordine_scalo_key;
       public                 postgres    false    229    229            �           2606    19291    scalo scalo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.scalo
    ADD CONSTRAINT scalo_pkey PRIMARY KEY (id_scalo);
 :   ALTER TABLE ONLY public.scalo DROP CONSTRAINT scalo_pkey;
       public                 postgres    false    229            �           2606    19214 #   stazione stazione_nome_stazione_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.stazione
    ADD CONSTRAINT stazione_nome_stazione_key UNIQUE (nome_stazione);
 M   ALTER TABLE ONLY public.stazione DROP CONSTRAINT stazione_nome_stazione_key;
       public                 postgres    false    218            �           2606    19212    stazione stazione_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.stazione
    ADD CONSTRAINT stazione_pkey PRIMARY KEY (id_stazione);
 @   ALTER TABLE ONLY public.stazione DROP CONSTRAINT stazione_pkey;
       public                 postgres    false    218            �           2606    19274 %   ticket ticket_codice_prenotazione_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_codice_prenotazione_key UNIQUE (codice_prenotazione);
 O   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_codice_prenotazione_key;
       public                 postgres    false    227            �           2606    19272    ticket ticket_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (codice_tckt);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public                 postgres    false    227            �           2606    19238    tratta tratta_codice_tratta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_codice_tratta_key UNIQUE (codice_tratta);
 I   ALTER TABLE ONLY public.tratta DROP CONSTRAINT tratta_codice_tratta_key;
       public                 postgres    false    224            �           2606    19236    tratta tratta_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (id_tratta);
 <   ALTER TABLE ONLY public.tratta DROP CONSTRAINT tratta_pkey;
       public                 postgres    false    224            �           2606    19255    viaggio viaggio_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.viaggio
    ADD CONSTRAINT viaggio_pkey PRIMARY KEY (id_viaggio);
 >   ALTER TABLE ONLY public.viaggio DROP CONSTRAINT viaggio_pkey;
       public                 postgres    false    226            �           2606    19299     scalo scalo_id_tratta_scalo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scalo
    ADD CONSTRAINT scalo_id_tratta_scalo_fkey FOREIGN KEY (id_tratta_scalo) REFERENCES public.tratta(id_tratta);
 J   ALTER TABLE ONLY public.scalo DROP CONSTRAINT scalo_id_tratta_scalo_fkey;
       public               postgres    false    229    224    4791            �           2606    19294 &   scalo scalo_id_viaggio_principale_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scalo
    ADD CONSTRAINT scalo_id_viaggio_principale_fkey FOREIGN KEY (id_viaggio_principale) REFERENCES public.viaggio(id_viaggio);
 P   ALTER TABLE ONLY public.scalo DROP CONSTRAINT scalo_id_viaggio_principale_fkey;
       public               postgres    false    4793    226    229            �           2606    19275     ticket ticket_id_passeggero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_passeggero_fkey FOREIGN KEY (id_passeggero) REFERENCES public.passeggero(id_passeggero);
 J   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_passeggero_fkey;
       public               postgres    false    227    4787    222            �           2606    19280    ticket ticket_id_viaggio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_viaggio_fkey FOREIGN KEY (id_viaggio) REFERENCES public.viaggio(id_viaggio);
 G   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_viaggio_fkey;
       public               postgres    false    4793    226    227            �           2606    19244 %   tratta tratta_id_stazione_arrivo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_id_stazione_arrivo_fkey FOREIGN KEY (id_stazione_arrivo) REFERENCES public.stazione(id_stazione);
 O   ALTER TABLE ONLY public.tratta DROP CONSTRAINT tratta_id_stazione_arrivo_fkey;
       public               postgres    false    218    224    4783            �           2606    19239 '   tratta tratta_id_stazione_partenza_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_id_stazione_partenza_fkey FOREIGN KEY (id_stazione_partenza) REFERENCES public.stazione(id_stazione);
 Q   ALTER TABLE ONLY public.tratta DROP CONSTRAINT tratta_id_stazione_partenza_fkey;
       public               postgres    false    4783    224    218            �           2606    19261    viaggio viaggio_id_mezzo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viaggio
    ADD CONSTRAINT viaggio_id_mezzo_fkey FOREIGN KEY (id_mezzo) REFERENCES public.mezzo(id_mezzo);
 G   ALTER TABLE ONLY public.viaggio DROP CONSTRAINT viaggio_id_mezzo_fkey;
       public               postgres    false    4785    220    226            �           2606    19256    viaggio viaggio_id_tratta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viaggio
    ADD CONSTRAINT viaggio_id_tratta_fkey FOREIGN KEY (id_tratta) REFERENCES public.tratta(id_tratta);
 H   ALTER TABLE ONLY public.viaggio DROP CONSTRAINT viaggio_id_tratta_fkey;
       public               postgres    false    4791    224    226            ^      x�3�)J���460�2��ML�b���� lo�      `   >   x�3��I,-J�t�L�K���4��4�54�52��I�%A$R+srR���s9c��b���� 4�      g      x������ � �      \   M   x�3���MTI-����s8=Ks2��8}3s���S�J�sR�|��1�[fQj^U�B������������ �      e      x������ � �      b   S   x�3������540�4�4�4202�50�,��Y����,fb�gj�e���	�m1F�mh�E�L�T���+F��� �V�      d   ;   x�E��  ���PRT�z���	ك��pz4F�+I������/b�����\�D�     