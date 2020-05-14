
DFA:     file format mach-o-x86-64


Disassembly of section .text:

00000001000008e0 <_main>:
   1000008e0:	55                   	push   %rbp
   1000008e1:	48 89 e5             	mov    %rsp,%rbp
   1000008e4:	48 83 ec 30          	sub    $0x30,%rsp
   1000008e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   1000008ef:	89 7d f8             	mov    %edi,-0x8(%rbp)
   1000008f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   1000008f6:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   1000008fa:	0f 84 1d 00 00 00    	je     10000091d <_main+0x3d>
   100000900:	48 8d 3d 3f 06 00 00 	lea    0x63f(%rip),%rdi        # 100000f46 <_build_empty_table+0x146>
   100000907:	b0 00                	mov    $0x0,%al
   100000909:	e8 c6 05 00 00       	callq  100000ed4 <_build_empty_table+0xd4>
   10000090e:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   100000915:	89 45 e4             	mov    %eax,-0x1c(%rbp)
   100000918:	e9 20 00 00 00       	jmpq   10000093d <_main+0x5d>
   10000091d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   100000921:	48 8b 40 08          	mov    0x8(%rax),%rax
   100000925:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   100000929:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
   10000092d:	e8 1e 00 00 00       	callq  100000950 <_read_dfa>
   100000932:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   100000939:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   10000093d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   100000940:	48 83 c4 30          	add    $0x30,%rsp
   100000944:	5d                   	pop    %rbp
   100000945:	c3                   	retq   
   100000946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   10000094d:	00 00 00 

0000000100000950 <_read_dfa>:
   100000950:	55                   	push   %rbp
   100000951:	48 89 e5             	mov    %rsp,%rbp
   100000954:	48 81 ec b0 01 00 00 	sub    $0x1b0,%rsp
   10000095b:	48 8b 05 9e 06 00 00 	mov    0x69e(%rip),%rax        # 100001000 <_build_empty_table+0x200>
   100000962:	48 8b 00             	mov    (%rax),%rax
   100000965:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   100000969:	48 89 bd d8 fe ff ff 	mov    %rdi,-0x128(%rbp)
   100000970:	48 8b bd d8 fe ff ff 	mov    -0x128(%rbp),%rdi
   100000977:	48 8d 35 ee 05 00 00 	lea    0x5ee(%rip),%rsi        # 100000f6c <_build_empty_table+0x16c>
   10000097e:	e8 3f 05 00 00       	callq  100000ec2 <_build_empty_table+0xc2>
   100000983:	48 8d b5 f0 fe ff ff 	lea    -0x110(%rbp),%rsi
   10000098a:	31 c9                	xor    %ecx,%ecx
   10000098c:	48 89 85 d0 fe ff ff 	mov    %rax,-0x130(%rbp)
   100000993:	48 89 f0             	mov    %rsi,%rax
   100000996:	48 89 c7             	mov    %rax,%rdi
   100000999:	48 89 b5 80 fe ff ff 	mov    %rsi,-0x180(%rbp)
   1000009a0:	89 ce                	mov    %ecx,%esi
   1000009a2:	ba 00 01 00 00       	mov    $0x100,%edx
   1000009a7:	e8 22 05 00 00       	callq  100000ece <_build_empty_table+0xce>
   1000009ac:	c7 85 c4 fe ff ff 00 	movl   $0x0,-0x13c(%rbp)
   1000009b3:	00 00 00 
   1000009b6:	48 8b 95 d0 fe ff ff 	mov    -0x130(%rbp),%rdx
   1000009bd:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   1000009c4:	be 00 01 00 00       	mov    $0x100,%esi
   1000009c9:	e8 ee 04 00 00       	callq  100000ebc <_build_empty_table+0xbc>
   1000009ce:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   1000009d5:	48 89 85 78 fe ff ff 	mov    %rax,-0x188(%rbp)
   1000009dc:	e8 c9 04 00 00       	callq  100000eaa <_build_empty_table+0xaa>
   1000009e1:	89 85 c8 fe ff ff    	mov    %eax,-0x138(%rbp)
   1000009e7:	81 bd c8 fe ff ff 00 	cmpl   $0x100,-0x138(%rbp)
   1000009ee:	01 00 00 
   1000009f1:	0f 8e 3b 00 00 00    	jle    100000a32 <_read_dfa+0xe2>
   1000009f7:	48 8d 3d 70 05 00 00 	lea    0x570(%rip),%rdi        # 100000f6e <_build_empty_table+0x16e>
   1000009fe:	be 00 01 00 00       	mov    $0x100,%esi
   100000a03:	b0 00                	mov    $0x0,%al
   100000a05:	e8 ca 04 00 00       	callq  100000ed4 <_build_empty_table+0xd4>
   100000a0a:	48 8b bd d0 fe ff ff 	mov    -0x130(%rbp),%rdi
   100000a11:	89 85 74 fe ff ff    	mov    %eax,-0x18c(%rbp)
   100000a17:	e8 94 04 00 00       	callq  100000eb0 <_build_empty_table+0xb0>
   100000a1c:	48 c7 85 e0 fe ff ff 	movq   $0x0,-0x120(%rbp)
   100000a23:	00 00 00 00 
   100000a27:	89 85 70 fe ff ff    	mov    %eax,-0x190(%rbp)
   100000a2d:	e9 66 03 00 00       	jmpq   100000d98 <_read_dfa+0x448>
   100000a32:	e9 00 00 00 00       	jmpq   100000a37 <_read_dfa+0xe7>
   100000a37:	48 8b bd d0 fe ff ff 	mov    -0x130(%rbp),%rdi
   100000a3e:	e8 73 04 00 00       	callq  100000eb6 <_build_empty_table+0xb6>
   100000a43:	88 c1                	mov    %al,%cl
   100000a45:	88 8d cf fe ff ff    	mov    %cl,-0x131(%rbp)
   100000a4b:	0f be c1             	movsbl %cl,%eax
   100000a4e:	83 f8 0a             	cmp    $0xa,%eax
   100000a51:	0f 84 28 00 00 00    	je     100000a7f <_read_dfa+0x12f>
   100000a57:	8b 85 c4 fe ff ff    	mov    -0x13c(%rbp),%eax
   100000a5d:	89 c1                	mov    %eax,%ecx
   100000a5f:	83 c1 01             	add    $0x1,%ecx
   100000a62:	89 8d c4 fe ff ff    	mov    %ecx,-0x13c(%rbp)
   100000a68:	48 0f be 95 cf fe ff 	movsbq -0x131(%rbp),%rdx
   100000a6f:	ff 
   100000a70:	48 8d 35 d9 15 00 00 	lea    0x15d9(%rip),%rsi        # 100002050 <_symbol_reverse_map>
   100000a77:	89 04 96             	mov    %eax,(%rsi,%rdx,4)
   100000a7a:	e9 b8 ff ff ff       	jmpq   100000a37 <_read_dfa+0xe7>
   100000a7f:	8b b5 c8 fe ff ff    	mov    -0x138(%rbp),%esi
   100000a85:	8b 95 c4 fe ff ff    	mov    -0x13c(%rbp),%edx
   100000a8b:	48 8d 3d f9 04 00 00 	lea    0x4f9(%rip),%rdi        # 100000f8b <_build_empty_table+0x18b>
   100000a92:	b0 00                	mov    $0x0,%al
   100000a94:	e8 3b 04 00 00       	callq  100000ed4 <_build_empty_table+0xd4>
   100000a99:	8b bd c8 fe ff ff    	mov    -0x138(%rbp),%edi
   100000a9f:	89 85 6c fe ff ff    	mov    %eax,-0x194(%rbp)
   100000aa5:	e8 56 03 00 00       	callq  100000e00 <_build_empty_table>
   100000aaa:	48 89 85 b8 fe ff ff 	mov    %rax,-0x148(%rbp)
   100000ab1:	bf 10 00 00 00       	mov    $0x10,%edi
   100000ab6:	e8 0d 04 00 00       	callq  100000ec8 <_build_empty_table+0xc8>
   100000abb:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
   100000ac2:	48 8b 85 b8 fe ff ff 	mov    -0x148(%rbp),%rax
   100000ac9:	48 8b bd b0 fe ff ff 	mov    -0x150(%rbp),%rdi
   100000ad0:	48 89 07             	mov    %rax,(%rdi)
   100000ad3:	8b 95 c8 fe ff ff    	mov    -0x138(%rbp),%edx
   100000ad9:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   100000ae0:	89 50 0c             	mov    %edx,0xc(%rax)
   100000ae3:	8b 95 c4 fe ff ff    	mov    -0x13c(%rbp),%edx
   100000ae9:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   100000af0:	89 50 08             	mov    %edx,0x8(%rax)
   100000af3:	c7 85 9c fe ff ff 00 	movl   $0x0,-0x164(%rbp)
   100000afa:	00 00 00 
   100000afd:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   100000b04:	48 8b 95 d0 fe ff ff 	mov    -0x130(%rbp),%rdx
   100000b0b:	be 00 01 00 00       	mov    $0x100,%esi
   100000b10:	e8 a7 03 00 00       	callq  100000ebc <_build_empty_table+0xbc>
   100000b15:	48 83 f8 00          	cmp    $0x0,%rax
   100000b19:	0f 84 5c 02 00 00    	je     100000d7b <_read_dfa+0x42b>
   100000b1f:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
   100000b26:	48 89 85 a8 fe ff ff 	mov    %rax,-0x158(%rbp)
   100000b2d:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   100000b34:	83 bd 9c fe ff ff 03 	cmpl   $0x3,-0x164(%rbp)
   100000b3b:	0f 8d fb 01 00 00    	jge    100000d3c <_read_dfa+0x3ec>
   100000b41:	e9 00 00 00 00       	jmpq   100000b46 <_read_dfa+0x1f6>
   100000b46:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000b4d:	0f be 08             	movsbl (%rax),%ecx
   100000b50:	83 f9 20             	cmp    $0x20,%ecx
   100000b53:	0f 85 17 00 00 00    	jne    100000b70 <_read_dfa+0x220>
   100000b59:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000b60:	48 83 c0 01          	add    $0x1,%rax
   100000b64:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   100000b6b:	e9 d6 ff ff ff       	jmpq   100000b46 <_read_dfa+0x1f6>
   100000b70:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000b77:	48 89 85 a8 fe ff ff 	mov    %rax,-0x158(%rbp)
   100000b7e:	83 bd 9c fe ff ff 02 	cmpl   $0x2,-0x164(%rbp)
   100000b85:	0f 8d 34 00 00 00    	jge    100000bbf <_read_dfa+0x26f>
   100000b8b:	e9 00 00 00 00       	jmpq   100000b90 <_read_dfa+0x240>
   100000b90:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000b97:	0f be 08             	movsbl (%rax),%ecx
   100000b9a:	83 f9 2c             	cmp    $0x2c,%ecx
   100000b9d:	0f 84 17 00 00 00    	je     100000bba <_read_dfa+0x26a>
   100000ba3:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000baa:	48 83 c0 01          	add    $0x1,%rax
   100000bae:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   100000bb5:	e9 d6 ff ff ff       	jmpq   100000b90 <_read_dfa+0x240>
   100000bba:	e9 34 00 00 00       	jmpq   100000bf3 <_read_dfa+0x2a3>
   100000bbf:	e9 00 00 00 00       	jmpq   100000bc4 <_read_dfa+0x274>
   100000bc4:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000bcb:	0f be 08             	movsbl (%rax),%ecx
   100000bce:	83 f9 0a             	cmp    $0xa,%ecx
   100000bd1:	0f 84 17 00 00 00    	je     100000bee <_read_dfa+0x29e>
   100000bd7:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000bde:	48 83 c0 01          	add    $0x1,%rax
   100000be2:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   100000be9:	e9 d6 ff ff ff       	jmpq   100000bc4 <_read_dfa+0x274>
   100000bee:	e9 00 00 00 00       	jmpq   100000bf3 <_read_dfa+0x2a3>
   100000bf3:	c7 85 8c fe ff ff 00 	movl   $0x0,-0x174(%rbp)
   100000bfa:	00 00 00 
   100000bfd:	48 63 85 8c fe ff ff 	movslq -0x174(%rbp),%rax
   100000c04:	48 8b 8d a0 fe ff ff 	mov    -0x160(%rbp),%rcx
   100000c0b:	48 8b 95 a8 fe ff ff 	mov    -0x158(%rbp),%rdx
   100000c12:	48 29 d1             	sub    %rdx,%rcx
   100000c15:	48 39 c8             	cmp    %rcx,%rax
   100000c18:	0f 8d 33 00 00 00    	jge    100000c51 <_read_dfa+0x301>
   100000c1e:	48 8b 85 a8 fe ff ff 	mov    -0x158(%rbp),%rax
   100000c25:	48 63 8d 8c fe ff ff 	movslq -0x174(%rbp),%rcx
   100000c2c:	8a 14 08             	mov    (%rax,%rcx,1),%dl
   100000c2f:	48 63 85 8c fe ff ff 	movslq -0x174(%rbp),%rax
   100000c36:	88 94 05 e8 fe ff ff 	mov    %dl,-0x118(%rbp,%rax,1)
   100000c3d:	8b 85 8c fe ff ff    	mov    -0x174(%rbp),%eax
   100000c43:	83 c0 01             	add    $0x1,%eax
   100000c46:	89 85 8c fe ff ff    	mov    %eax,-0x174(%rbp)
   100000c4c:	e9 ac ff ff ff       	jmpq   100000bfd <_read_dfa+0x2ad>
   100000c51:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000c58:	48 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%rcx
   100000c5f:	48 29 c8             	sub    %rcx,%rax
   100000c62:	c6 84 05 e8 fe ff ff 	movb   $0x0,-0x118(%rbp,%rax,1)
   100000c69:	00 
   100000c6a:	8b 95 9c fe ff ff    	mov    -0x164(%rbp),%edx
   100000c70:	85 d2                	test   %edx,%edx
   100000c72:	89 95 68 fe ff ff    	mov    %edx,-0x198(%rbp)
   100000c78:	0f 84 39 00 00 00    	je     100000cb7 <_read_dfa+0x367>
   100000c7e:	e9 00 00 00 00       	jmpq   100000c83 <_read_dfa+0x333>
   100000c83:	8b 85 68 fe ff ff    	mov    -0x198(%rbp),%eax
   100000c89:	83 e8 01             	sub    $0x1,%eax
   100000c8c:	89 85 64 fe ff ff    	mov    %eax,-0x19c(%rbp)
   100000c92:	0f 84 36 00 00 00    	je     100000cce <_read_dfa+0x37e>
   100000c98:	e9 00 00 00 00       	jmpq   100000c9d <_read_dfa+0x34d>
   100000c9d:	8b 85 68 fe ff ff    	mov    -0x198(%rbp),%eax
   100000ca3:	83 e8 02             	sub    $0x2,%eax
   100000ca6:	89 85 60 fe ff ff    	mov    %eax,-0x1a0(%rbp)
   100000cac:	0f 84 33 00 00 00    	je     100000ce5 <_read_dfa+0x395>
   100000cb2:	e9 5a 00 00 00       	jmpq   100000d11 <_read_dfa+0x3c1>
   100000cb7:	48 8d bd e8 fe ff ff 	lea    -0x118(%rbp),%rdi
   100000cbe:	e8 e7 01 00 00       	callq  100000eaa <_build_empty_table+0xaa>
   100000cc3:	89 85 98 fe ff ff    	mov    %eax,-0x168(%rbp)
   100000cc9:	e9 48 00 00 00       	jmpq   100000d16 <_read_dfa+0x3c6>
   100000cce:	48 8d bd e8 fe ff ff 	lea    -0x118(%rbp),%rdi
   100000cd5:	e8 d0 01 00 00       	callq  100000eaa <_build_empty_table+0xaa>
   100000cda:	89 85 94 fe ff ff    	mov    %eax,-0x16c(%rbp)
   100000ce0:	e9 31 00 00 00       	jmpq   100000d16 <_read_dfa+0x3c6>
   100000ce5:	0f be 85 e8 fe ff ff 	movsbl -0x118(%rbp),%eax
   100000cec:	89 85 90 fe ff ff    	mov    %eax,-0x170(%rbp)
   100000cf2:	8b b5 90 fe ff ff    	mov    -0x170(%rbp),%esi
   100000cf8:	48 8d 3d b2 02 00 00 	lea    0x2b2(%rip),%rdi        # 100000fb1 <_build_empty_table+0x1b1>
   100000cff:	b0 00                	mov    $0x0,%al
   100000d01:	e8 ce 01 00 00       	callq  100000ed4 <_build_empty_table+0xd4>
   100000d06:	89 85 5c fe ff ff    	mov    %eax,-0x1a4(%rbp)
   100000d0c:	e9 05 00 00 00       	jmpq   100000d16 <_read_dfa+0x3c6>
   100000d11:	e9 00 00 00 00       	jmpq   100000d16 <_read_dfa+0x3c6>
   100000d16:	48 8b 85 a0 fe ff ff 	mov    -0x160(%rbp),%rax
   100000d1d:	48 83 c0 01          	add    $0x1,%rax
   100000d21:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   100000d28:	8b 8d 9c fe ff ff    	mov    -0x164(%rbp),%ecx
   100000d2e:	83 c1 01             	add    $0x1,%ecx
   100000d31:	89 8d 9c fe ff ff    	mov    %ecx,-0x164(%rbp)
   100000d37:	e9 f8 fd ff ff       	jmpq   100000b34 <_read_dfa+0x1e4>
   100000d3c:	48 63 85 90 fe ff ff 	movslq -0x170(%rbp),%rax
   100000d43:	48 8d 0d 06 13 00 00 	lea    0x1306(%rip),%rcx        # 100002050 <_symbol_reverse_map>
   100000d4a:	8b 14 81             	mov    (%rcx,%rax,4),%edx
   100000d4d:	48 8b 85 b0 fe ff ff 	mov    -0x150(%rbp),%rax
   100000d54:	48 8b 00             	mov    (%rax),%rax
   100000d57:	48 63 8d 98 fe ff ff 	movslq -0x168(%rbp),%rcx
   100000d5e:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   100000d62:	48 63 8d 94 fe ff ff 	movslq -0x16c(%rbp),%rcx
   100000d69:	89 14 88             	mov    %edx,(%rax,%rcx,4)
   100000d6c:	c7 85 9c fe ff ff 00 	movl   $0x0,-0x164(%rbp)
   100000d73:	00 00 00 
   100000d76:	e9 82 fd ff ff       	jmpq   100000afd <_read_dfa+0x1ad>
   100000d7b:	48 8b bd d0 fe ff ff 	mov    -0x130(%rbp),%rdi
   100000d82:	e8 29 01 00 00       	callq  100000eb0 <_build_empty_table+0xb0>
   100000d87:	48 c7 85 e0 fe ff ff 	movq   $0x0,-0x120(%rbp)
   100000d8e:	00 00 00 00 
   100000d92:	89 85 58 fe ff ff    	mov    %eax,-0x1a8(%rbp)
   100000d98:	48 8b 85 e0 fe ff ff 	mov    -0x120(%rbp),%rax
   100000d9f:	48 8b 0d 5a 02 00 00 	mov    0x25a(%rip),%rcx        # 100001000 <_build_empty_table+0x200>
   100000da6:	48 8b 09             	mov    (%rcx),%rcx
   100000da9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   100000dad:	48 39 d1             	cmp    %rdx,%rcx
   100000db0:	48 89 85 50 fe ff ff 	mov    %rax,-0x1b0(%rbp)
   100000db7:	0f 85 10 00 00 00    	jne    100000dcd <_read_dfa+0x47d>
   100000dbd:	48 8b 85 50 fe ff ff 	mov    -0x1b0(%rbp),%rax
   100000dc4:	48 81 c4 b0 01 00 00 	add    $0x1b0,%rsp
   100000dcb:	5d                   	pop    %rbp
   100000dcc:	c3                   	retq   
   100000dcd:	e8 d2 00 00 00       	callq  100000ea4 <_build_empty_table+0xa4>
   100000dd2:	0f 0b                	ud2    
   100000dd4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   100000ddb:	00 00 00 
   100000dde:	66 90                	xchg   %ax,%ax

0000000100000de0 <_run_dfa>:
   100000de0:	55                   	push   %rbp
   100000de1:	48 89 e5             	mov    %rsp,%rbp
   100000de4:	31 c0                	xor    %eax,%eax
   100000de6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   100000dea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   100000dee:	89 55 ec             	mov    %edx,-0x14(%rbp)
   100000df1:	5d                   	pop    %rbp
   100000df2:	c3                   	retq   
   100000df3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   100000dfa:	00 00 00 
   100000dfd:	0f 1f 00             	nopl   (%rax)

0000000100000e00 <_build_empty_table>:
   100000e00:	55                   	push   %rbp
   100000e01:	48 89 e5             	mov    %rsp,%rbp
   100000e04:	48 83 ec 20          	sub    $0x20,%rsp
   100000e08:	89 7d fc             	mov    %edi,-0x4(%rbp)
   100000e0b:	48 63 45 fc          	movslq -0x4(%rbp),%rax
   100000e0f:	48 c1 e0 03          	shl    $0x3,%rax
   100000e13:	48 89 c7             	mov    %rax,%rdi
   100000e16:	e8 ad 00 00 00       	callq  100000ec8 <_build_empty_table+0xc8>
   100000e1b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   100000e1f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   100000e26:	8b 45 ec             	mov    -0x14(%rbp),%eax
   100000e29:	3b 45 fc             	cmp    -0x4(%rbp),%eax
   100000e2c:	0f 8d 67 00 00 00    	jge    100000e99 <_build_empty_table+0x99>
   100000e32:	48 63 45 fc          	movslq -0x4(%rbp),%rax
   100000e36:	48 c1 e0 02          	shl    $0x2,%rax
   100000e3a:	48 89 c7             	mov    %rax,%rdi
   100000e3d:	e8 86 00 00 00       	callq  100000ec8 <_build_empty_table+0xc8>
   100000e42:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
   100000e46:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
   100000e4a:	48 89 04 cf          	mov    %rax,(%rdi,%rcx,8)
   100000e4e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   100000e55:	8b 45 e8             	mov    -0x18(%rbp),%eax
   100000e58:	3b 45 fc             	cmp    -0x4(%rbp),%eax
   100000e5b:	0f 8d 25 00 00 00    	jge    100000e86 <_build_empty_table+0x86>
   100000e61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   100000e65:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
   100000e69:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
   100000e6d:	48 63 4d e8          	movslq -0x18(%rbp),%rcx
   100000e71:	c7 04 88 ff ff ff ff 	movl   $0xffffffff,(%rax,%rcx,4)
   100000e78:	8b 45 e8             	mov    -0x18(%rbp),%eax
   100000e7b:	83 c0 01             	add    $0x1,%eax
   100000e7e:	89 45 e8             	mov    %eax,-0x18(%rbp)
   100000e81:	e9 cf ff ff ff       	jmpq   100000e55 <_build_empty_table+0x55>
   100000e86:	e9 00 00 00 00       	jmpq   100000e8b <_build_empty_table+0x8b>
   100000e8b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   100000e8e:	83 c0 01             	add    $0x1,%eax
   100000e91:	89 45 ec             	mov    %eax,-0x14(%rbp)
   100000e94:	e9 8d ff ff ff       	jmpq   100000e26 <_build_empty_table+0x26>
   100000e99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   100000e9d:	48 83 c4 20          	add    $0x20,%rsp
   100000ea1:	5d                   	pop    %rbp
   100000ea2:	c3                   	retq   

Disassembly of section __TEXT.__stubs:

0000000100000ea4 <__TEXT.__stubs>:
   100000ea4:	ff 25 56 11 00 00    	jmpq   *0x1156(%rip)        # 100002000 <_build_empty_table+0x1200>
   100000eaa:	ff 25 58 11 00 00    	jmpq   *0x1158(%rip)        # 100002008 <_build_empty_table+0x1208>
   100000eb0:	ff 25 5a 11 00 00    	jmpq   *0x115a(%rip)        # 100002010 <_build_empty_table+0x1210>
   100000eb6:	ff 25 5c 11 00 00    	jmpq   *0x115c(%rip)        # 100002018 <_build_empty_table+0x1218>
   100000ebc:	ff 25 5e 11 00 00    	jmpq   *0x115e(%rip)        # 100002020 <_build_empty_table+0x1220>
   100000ec2:	ff 25 60 11 00 00    	jmpq   *0x1160(%rip)        # 100002028 <_build_empty_table+0x1228>
   100000ec8:	ff 25 62 11 00 00    	jmpq   *0x1162(%rip)        # 100002030 <_build_empty_table+0x1230>
   100000ece:	ff 25 64 11 00 00    	jmpq   *0x1164(%rip)        # 100002038 <_build_empty_table+0x1238>
   100000ed4:	ff 25 66 11 00 00    	jmpq   *0x1166(%rip)        # 100002040 <_build_empty_table+0x1240>

Disassembly of section __TEXT.__stub_helper:

0000000100000edc <__TEXT.__stub_helper>:
   100000edc:	4c 8d 1d 65 11 00 00 	lea    0x1165(%rip),%r11        # 100002048 <__dyld_private>
   100000ee3:	41 53                	push   %r11
   100000ee5:	ff 25 1d 01 00 00    	jmpq   *0x11d(%rip)        # 100001008 <_build_empty_table+0x208>
   100000eeb:	90                   	nop
   100000eec:	68 00 00 00 00       	pushq  $0x0
   100000ef1:	e9 e6 ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000ef6:	68 18 00 00 00       	pushq  $0x18
   100000efb:	e9 dc ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000f00:	68 24 00 00 00       	pushq  $0x24
   100000f05:	e9 d2 ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000f0a:	68 32 00 00 00       	pushq  $0x32
   100000f0f:	e9 c8 ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000f14:	68 3f 00 00 00       	pushq  $0x3f
   100000f19:	e9 be ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000f1e:	68 4c 00 00 00       	pushq  $0x4c
   100000f23:	e9 b4 ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000f28:	68 59 00 00 00       	pushq  $0x59
   100000f2d:	e9 aa ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000f32:	68 67 00 00 00       	pushq  $0x67
   100000f37:	e9 a0 ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>
   100000f3c:	68 75 00 00 00       	pushq  $0x75
   100000f41:	e9 96 ff ff ff       	jmpq   100000edc <_build_empty_table+0xdc>

Disassembly of section __TEXT.__unwind_info:

0000000100000fb8 <__TEXT.__unwind_info>:
   100000fb8:	01 00                	add    %eax,(%rax)
   100000fba:	00 00                	add    %al,(%rax)
   100000fbc:	1c 00                	sbb    $0x0,%al
   100000fbe:	00 00                	add    %al,(%rax)
   100000fc0:	00 00                	add    %al,(%rax)
   100000fc2:	00 00                	add    %al,(%rax)
   100000fc4:	1c 00                	sbb    $0x0,%al
   100000fc6:	00 00                	add    %al,(%rax)
   100000fc8:	00 00                	add    %al,(%rax)
   100000fca:	00 00                	add    %al,(%rax)
   100000fcc:	1c 00                	sbb    $0x0,%al
   100000fce:	00 00                	add    %al,(%rax)
   100000fd0:	02 00                	add    (%rax),%al
   100000fd2:	00 00                	add    %al,(%rax)
   100000fd4:	e0 08                	loopne 100000fde <_build_empty_table+0x1de>
   100000fd6:	00 00                	add    %al,(%rax)
   100000fd8:	34 00                	xor    $0x0,%al
   100000fda:	00 00                	add    %al,(%rax)
   100000fdc:	34 00                	xor    $0x0,%al
   100000fde:	00 00                	add    %al,(%rax)
   100000fe0:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
   100000fe1:	0e                   	(bad)  
   100000fe2:	00 00                	add    %al,(%rax)
   100000fe4:	00 00                	add    %al,(%rax)
   100000fe6:	00 00                	add    %al,(%rax)
   100000fe8:	34 00                	xor    $0x0,%al
   100000fea:	00 00                	add    %al,(%rax)
   100000fec:	03 00                	add    (%rax),%eax
   100000fee:	00 00                	add    %al,(%rax)
   100000ff0:	0c 00                	or     $0x0,%al
   100000ff2:	01 00                	add    %eax,(%rax)
   100000ff4:	10 00                	adc    %al,(%rax)
   100000ff6:	01 00                	add    %eax,(%rax)
   100000ff8:	00 00                	add    %al,(%rax)
   100000ffa:	00 00                	add    %al,(%rax)
   100000ffc:	00 00                	add    %al,(%rax)
   100000ffe:	00 01                	add    %al,(%rcx)
