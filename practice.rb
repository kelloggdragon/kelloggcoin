# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

# Create a hash to store each user's balance
wallets = {}

# Initialize all users to 0 using simple each and if checks
for transaction in blockchain
  to_user = transaction["to_user"]
  from_user = transaction["from_user"]

  if wallets[to_user] == nil
    wallets[to_user] = 0
  end

  if from_user && wallets[from_user] == nil
    wallets[from_user] = 0
  end
end

# Iterate through each transaction
for transaction in blockchain
  from_user = transaction["from_user"]
  to_user = transaction["to_user"]
  amount = transaction["amount"]
  
  # If from_user exists, subtract the amount (they sent coins)
  if from_user
    wallets[from_user] = wallets[from_user] - amount
  end

  wallets[to_user] = wallets[to_user] + amount

end

# Display each user's balance

for user in wallets
  user_name = user[0]
  balance = user[1]
  puts "#{user_name.capitalize}'s KelloggCoin balance is #{balance}"
end
