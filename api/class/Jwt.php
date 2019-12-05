<?php
class Jwt
{
    // http://codecipher.in/php-jwt/
    public $user;
    public $admin;
    public $secret = 'jwt%YNWA!';
    public $header = [];
    public $payload = [];
    public $data;
    public $signature;
    public $iss = "www.application-web-progressive.fr/api"; // The issuer of the token 
    public $sub; // The subject of the token  
    public $aud = "www.application-web-progressive.fr"; // The audience of the token 
    public $exp; // This will probably be the registered claim most often used. This will define the expiration in NumericDate value. The expiration MUST be after the current date/time.
    public $nbf; // Defines the time before which the JWT MUST NOT be accepted for processing
    public $iat; // The time the JWT was issued. Can be used to determine the age of the JWT
    public $jti; // Unique identifier for the JWT. Can be used to prevent the JWT from being 
    public $token;
    public function __construct($user = null, $admin = false)
    {
        $this->header = [
            "alg"     => "HS256",
            "typ"     => "JWT"
        ];
        $this->payload = [
            "iss" => $this->iss,
            "sub" => "tokenJwt",
            "aud" => $this->aud,
            "user" => $user,
            "admin" => $admin
        ];
        $this->token = $this->generateJWT();
    }
    function generateJWT()
    {
        $headerEncoded = rtrim(base64_encode(json_encode($this->header)));
        $payloadEncoded = rtrim(base64_encode(json_encode($this->payload)));
        $secretEncode = rtrim(base64_encode(json_encode($this->secret)));
        // Delimit with period (.)
        $dataEncoded = "$headerEncoded.$payloadEncoded";
        $rawSignature = hash_hmac('sha256', $dataEncoded, $secretEncode, true);
        $signatureEncoded = rtrim(base64_encode($rawSignature));
        // Delimit with second period (.)
        $jwt = "$dataEncoded.$signatureEncoded";
        return $jwt;
    }
    function verifyJWT(string $jwt): bool
    {
        list($headerEncoded, $payloadEncoded, $signatureEncoded) = explode('.', $jwt);
        $dataEncoded = "$headerEncoded.$payloadEncoded";
        $signature = base64_decode($signatureEncoded);
        $rawSignature = hash_hmac('sha256', $dataEncoded, $this->secret, true);
        return hash_equals($rawSignature, $signature);
        // $verify = verifyJWT('sha256', $jwt, $secret);// true or false
    }
}
