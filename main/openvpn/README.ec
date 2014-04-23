Since 2.4.0, OpenVPN has official support for elliptic curve crypto. Elliptic
curves are an alternative to RSA for asymmetric encryption.

Elliptic curve crypto ('ECC') can be used for the ('TLS') control channel only
in OpenVPN; the data channel (encrypting the actual network traffic) uses
symmetric encryption. ECC can be used in TLS for authentication (ECDSA) and key
exchange (ECDH).

Note: ECC is available in OpenSSL builds of OpenVPN only. ECC for PolarSSL
builds will follow soon.

Key exchange (ECDH)
-------------------
OpenVPN 2.4.0 and newer automatically initialize ECDH parameters. When ECDSA is
used for authentication, the curve used for the server certificate will be used
for ECDH too. When autodetection fails (e.g. when using RSA certificates)
OpenVPN falls back to the secp384r1 curve.

An administrator can force an OpenVPN server to use a specific curve using the
--ecdh-curve <curvename> option with one of the curves listed as available by
the --show-curves option. Clients will use the same curve as selected by the
server.

Note that not all curves listed by --show-curves are available for use with TLS;
in that case connecting will fail with a 'no shared cipher' TLS error.

Authentication (ECDSA)
----------------------
Since OpenVPN 2.4.0, using ECDSA certificates works 'out of the box'. Which
specific curves and cipher suites are available depends on your version and
configuration of the crypto library. The crypto library will automatically
select a cipher suite for the TLS control channel.

Support for generating an ECDSA certificate chain is available in EasyRSA (in
spite of it's name) since EasyRSA 3.0. The parameters you're looking for are
'--use-algo=ec' and '--curve=<curve_name>'. See the EasyRSA documentation for
more details on generating ECDSA certificates.
