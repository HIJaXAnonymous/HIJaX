        	�  �      Z��������B4#,�����7���^Z $�            x��XmO;��_qV��B�/�إ�hE��UW�"gƓf����V��}��y���ju#A2��y}΋�ߧ�\�T,	���#:S3�vIP�f��Q�:�ݥ\&�X��Ld�V�O���J���g�=ǀTnd5�sI��pF�L�� ��<�8Ջef��O;�n�o�QȘ>2M�T!�z3,�#ʤ�Eٱ?�����Q�(29��.()e2T&�Դ��*'��}���D�*Z�Z��2���2KL����/4��`�Le&b�*��
��X25�l�E3�!M���9�r�U�s�"W:�Tط�df�D-�y�]�7�"g2�>ׁ�Kb�g��q'1Sp�����z�܆���ͭl}�Ꮫ[E�6/$�Z�s��)s��q�*�i*�02*�.��~M>}�2��˯�뷓�����!���|����8àL���}sqv}�	�'�G���+�}>�\���0����tBW'ד����5]}���|s֣)_GS�^m���^�'[���P�BŦ��WD���8��x�@@ �9 �~��c/�"��̺�
P�F�:��<_������,-z:��cw��{���(:��g��7p���x<���z�e�-;���}S�,�łnP^����a���ѷ ��M�7���<,��\���/��@'m#��d�AJ���b��`�ER�E&M��"�K=Y.\�s�����q��9=�y$�-r����E�jI�����[�����}ȲS�ȆN]$KN�Ep/a�}��(��/��=�,Q�s�j�@�"����M b��5�NY$�L�5lS�dq<\K���m��Tt�Aw�evl�W3��9�	��?�n���E|.�\g#�Ae�r�9����}|�����U�~�Ԗ��J�28����`��
�$Y�GV��.ަ�mQ���o���qH��eP�BG��倒[�ض�;]<�5mOSZ��.P���G��{�˦�`P�$����6��,o'�õK$��(H�Gl�ό� ��;?�C�S�7����q ��!G�v_�L?�6{�=:ƣ�ܟ�I*���t��̍wbl=�O�<��Ʌ�kdj�b�]fLe�@���"+��JE镾�|Y�	�yf��}	C�e�8�����ۆ�k�T2��Jx?����y�u��E�H7�F�,P$���I%<s:�VM(%�xY�w�����X}�VX�gt��b��oh�)ۭ"�C�1�anU�VEz�Т�Ѭ<0HS~Vb�|�V���6�����]�܏6|T>A4%RX�msq6J)+��A:�(��v#�"�8N]���f	�t����&�e��b��ܱ��n��Ѝ*��;e�>h���W�V~z�Џ��y61�-���:�E����J���hHmj�j�rr���枯AW�5�]ɦ�E�R��p�q�?o��I0J���\H�w˳2�^Ӟs]� t�!K�q�T��UL�!pɬ�}T;MIu����L�9z.$���)Щ�����ǆ�n-��.�"t�]7ڕ��ʎe����g��.e�dmWP�:�FZ��eۧ\.��*b������:�6Lۍ<��^c����}ǼPњ
�-ꥎ����1�d��
�A_�Ƶ������:����m�a�yn��os�� 3����ֱk ��*�l;Q�%%��zA[-��}�^u���@ת]Nh���!��em�^uKm�z}k�
%
�B�~���m��fX{��I�g�&d��w�u�l\�|�1���k���a������I��+�-�j <lЕ$���X{�|���GG�����K5<>QIǛ��{�����]K�2 `tP�", 5�$��`�wwER�6|y<I��_v�_c��9����W���pa�09�S	��7�O>��������r7Gq4p�"5uTM_�i ����*��M!;�2l��]w<_�uh�0���;.�n@��>�H�[LR�̎x���]�S���q�f6{w{e�yէ�K�me��Q���KU ��z<G����~o����}a1�/�!�A�*�{~e�w�����4�r���,�ͳe�.��\�^wGi*���P�Uh-���j����!K0�jA�3��A�X&��l4�ĔL_����ׯe�V9|�'��Ɠd�k]Ő�r���������)ե�ʪ�9�m�*��-�
�ժ[��
���QE��:���b�h�QLͻ������=��{��kP�i�_"���ZI�rY��s�N��
/��6��a�k��
���?����%>�<��w�"a�\��W V�;%2��G��c�:���~����g��/�PV��2�+AW.��|Wk��״�N�ܴ^��Y@�kwv�r'�Բ��^�T��}��V���>���Y@Q�l����k�t
���M���~��2��&��=R��d��F?�{`�9�\Se�����s���),yR͂����*�;q��k�8�'�ɬ���<�
~�������    	�     J  �      ]    ����
�s	aΥ��a��S#�              5  o   >      typename CholMatrixType::InnerIterator it(m_matrix, k);
    
     �       `   �����!��.a���d��2��:�                �      �  �   m  // FIXME should be .adjoint() but it fails to compile...
  m_matrix.transpose().solveTriangularInPlace(b);
    
�     Z       b   ����w����`�d��>̦�kQ              �  1   N        ++it; // skip j-th element, and process remaining column coefficients
    
�     M       �   �����❚^���� U�D���S�              �  �   A    typedef SparseMatrix<Scalar,LowerTriangular> CholMatrixType;
    1     �  �     �   �����h��M�9�;x_�����7            x����N1�M��#���q���D ]��th�I���F�[`]AM1��73Ƭ��Y�su��x��v��S,���P�'����]�M��d��9Q�1��	[ko w@�\|��e�{I(=l6�n+%<������(;����ebP�q��ˎ1�ˑ27�����DA��մ���(K����Ͱ��U,�K�o��_	�X�    �     �  �        ������#SKx�;�L�MB��            x���1KA�ӧ��"�5�4�`��P�0�deovٝ�(v�v�"j!X8��a�o�s�77ƽc�+*��V^/-�z���|>���:��w����R�D�3���&
��. i%<A��9�H6}��DY�ʚQ4fng��Ĺ�[ˋ�:���\�ܥ@�?��ˁ���O����U�;��#v8��v1��ޤLRR,\տ�7)��.-��.����,���    �     �  �        �����#��:_�:���=1Л�J��             x�c`���� ����ଠ���XR�Y�W��[��X�� �%楗�$��䗧���v�z��9e��y9�ɩI��\@�v20�0��Q ��R�YE�y��ũ@��-( �\> ��2�P* ��S�    U     �  �     @   ����~3J9�5Йg$q���3�e            x�c`�``�c``�RPȍ�M,)ʬ�+N-�J-��д�B-J-N-*K�H�����khj�00H|a`��b����#3��D#K'KS�V���ZA__��3��U��8U"픘�4B���U \*!��Vd� Y)��:
`ˀe�9���
Z
� 7J��G@đ��e�%�dV���
 �(K         #  �     }   ����-��
��K�Pw|��7���               B   �   // for linear algebra.
    0     U  �   	  �   	����x��U�<���IT33�)�c            x�c``?���!���� ��E�əř�y
�
A��9�ɉ9�Ez��
Z
���yVV)�����6�v��\��@Oms��3B    �     �  �   
     	�����[[Ak0�ћ*�^�(AsN            x�c``?���!���� ��E�əř�y
�
A��9�ɉ9�Ez��
Z
���yVVpE6%v��\��@�MM��8h�;ȴ�Ē��
���܂�ĒT /1/��<,3���'�<�(.4B�8?�,�3/ '19U#	b�[K�� '&��+J�+.�/Nj�evhAf˸ �T�١��L% B��A    F     U  �     .      
��:�D�F���"O�NU �            x�c``?���!���� ��E�əř�y
�
A��9�ɉ9�Ez��
Z
���yVV)�����6�v��\��@Oms��3B    �     �  �     I   ������;�zMxN1 ��6|�[�            x�c``ka``;���`� %��)�i
��Eũ��%E�6�ɉ9�Ev
��9��2k.iA � j�UPȍ��镤��$��* y�y�@�a���6>��Ev�z��9e��y9�ɩI�`�>20�8r�"�hJQb^qA~q*P.C
p�(���&z�LD8�"c�b_�    I     a  �     �   �����Ժ��&m�a�4=R,��d            x�c``��������� ��E�əř�y
�
A��9�ɉ9�Ez��
Z
���yVV~��!E��%�6%vVV)����44��8��8��V  ��;f    �     �  �     
_   �������7"�d,�f����ڞE            x�c``3c c= (�,HMIM�y���
��%E�!@���g^Jj����b`fb�Ny�������BqfU���B�^Q~y��&H��5� �*+(��)h@Tf�X)�&km�,M�r�V ^Tr��l[��l�,mC��l�Z��@��V�+r�s�>�; ]=m    P     �  �     
u   ������
�X����j&ǢWL�u=��            x�c`^�� |���AWA�17)3,5�$��&891'�H�3/%��N�$5� "�Q�Y��i��� Y	ė��� -�HA��� 5/17�AVV�%�E�@q����:
��E�əř�yZE��@ykm��M. ��3�    �     S       
v   ����ď��"�ݼ3[��������              �  �   G  m_matrix.adjoint().template triangularView<Upper>().solveInPlace(b);
