# 1) Node'u kurmaya başlayalım.

``` 
wget -O massaTR.sh https://raw.githubusercontent.com/thisislexar/Massa-Testnet/main/massaTR.sh && chmod +x massaTR.sh && ./massaTR.sh
```
## Burada `1` yazıp enter'lıyoruz.

![image](https://user-images.githubusercontent.com/101462877/205732305-989494a7-b7f6-4a2d-bd8f-d51a453f8ef3.png) 

## Burada bir şifre giriyoruz ve kenara not alıyoruz.

![image](https://user-images.githubusercontent.com/101462877/205732791-d95cabf2-79b7-4079-a503-7a481af0b2c5.png)


# 2) Devam.

## Node için screen açalım.
```
source $HOME/.bash_profile
```
```
sudo ufw allow 31244
sudo ufw allow 31245
sudo ufw enable
```
```
cd $HOME/massa/massa-node
screen -S node
```

## Aşağıdaki komutu olduğu gibi yapıştırıyoruz, burası bir tık uzun sürebilir.

```
RUST_BACKTRACE=full cargo run --release -- -p $PASSWORD|& tee logs.txt
```

![image](https://user-images.githubusercontent.com/101462877/205748532-3cb07a7a-ef9e-424b-842a-b868a5255f30.png)

## Loglar aşağıdaki gibi olduktan sonra devam ediyoruz.

![image](https://user-images.githubusercontent.com/101462877/205751293-d8988575-b8b1-4cdc-9803-19115303dd8f.png)


## CTRL + A + D yaparak node screen'inden çıkalım.

![image](https://user-images.githubusercontent.com/101462877/205751487-84c8b024-fad2-4b91-944a-18888ba61816.png)

## Client klasörüne gidip Client screen'i açalım.

```
cd $HOME/massa/massa-client/
screen -S client
```
## `<Password>` kısmını değiştirerek aşağıdaki komutu çalıştıralım.
```
cargo run --release -- -p <Password>
```

## Bitmesini bekliyoruz.

![image](https://user-images.githubusercontent.com/101462877/205752092-8717fe0f-349b-40ed-9e95-c11267f06c62.png)

## Bittikten sonra karşınıza böyle bir ekran çıkar. Wallet oluşturmak için aşağıdaki komutu giriyoruz.

![image](https://user-images.githubusercontent.com/101462877/205752491-b4e5ba75-7cc2-4664-904b-9aa425a030d2.png)

```
wallet_generate_secret_key
```

![image](https://user-images.githubusercontent.com/101462877/205753382-48062e24-5c54-4426-98f8-9c0eb9231a01.png)

## Ardından aşağıdaki komut ile cüzdan bilgilerinizi öğrenebilirsiniz.

```
wallet_info
```

![image](https://user-images.githubusercontent.com/101462877/205755988-0b2d0c20-de5f-42e2-a940-9b5f497585c3.png)
## Devamında aşağıdaki komutta <your_secret_key> kısmını değiştirerek giriyoruz. O kısımda yazmanız gereken şey ise wallet_info kısmında gördüğünüz scret key.

```
node_add_staking_secret_keys <your_secret_key>
```

Örneğin:

```
node_add_staking_secret_keys S12xxxx6Esnbxxxxxxxxxxxxxxx
```

## Sonrasında [Discord](https://discord.gg/massa)'a giderek faucet alıyoruz.

![image](https://user-images.githubusercontent.com/101462877/205754649-60fe17b6-7fef-4797-a669-e0c56a501980.png)

## Tekrar terminale dönüyoruz ve `wallet_info` komutuyla token gelmiş mi kontrol ediyoruz.

![image](https://user-images.githubusercontent.com/101462877/205754782-0eef5dbd-8134-42e6-a64c-fe2258c79950.png)

## Tokenlarımız geldiyse, aşağıdaki komutu `<ADRES>` kısmını değiştirerek giriyoruz.
  
```
buy_rolls <ADRES> 1 0
```  
  
Örneğin şu şekilde: 
  
```
buy_rolls A12nr9K1XfXBfKw75cQVNZafFRjwMj6pYwpS7tf2RnHaLitv6cG4 1 0
```  

## Sonrasında yine Discord'da testnets-rewards-registration kanalına giderek rastgele mesaj atıyoruz.

![image](https://user-images.githubusercontent.com/101462877/205756838-77ed5848-6f31-445d-956b-554893ae70d8.png)

## MassaBot bize DM'den mesaj atıyor, attığı mesajda gerekli yeri terminale yapıştırıyoruz. your_staking_address kısmını kendi cüzdan adresinizle değiştirmeyi unutmayın.


<img width="822" alt="Ekran Resmi 2022-12-06 01 33 16" src="https://user-images.githubusercontent.com/101462877/205757206-b565dbc2-0e7a-4a02-8d0b-bbfcc92d9b52.png">

## Terminale girdiğimiz komutun ardından bize bir çıktı veriyor, bu çıktıyı MassaBot ile olan chat'e yolluyorsunuz.

<img width="1183" alt="Ekran Resmi 2022-12-06 01 35 16" src="https://user-images.githubusercontent.com/101462877/205758713-300ee5a5-f2af-4408-b1f3-6cdada02c503.png">


## Ardından MassaBot'a Massa node'u kurduğunuz sunucu IP'sini yollayın.

<img width="823" alt="Ekran Resmi 2022-12-06 01 39 50" src="https://user-images.githubusercontent.com/101462877/205758361-60c4f725-477e-4f7c-817a-3f72cc30a810.png">


## Her şey tamamsa aşağıdaki gibi bir mesaj alırsınız.

<img width="839" alt="Ekran Resmi 2022-12-06 01 37 48" src="https://user-images.githubusercontent.com/101462877/205758012-a81bc04a-e94f-46b8-a298-4e93e9da73cf.png">



# Sorularınız için: [LossNode Chat](https://t.me/Lossnode)
