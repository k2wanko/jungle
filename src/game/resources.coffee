resources = do ->
  path = "/images/"
  res =
    chara: "chara5.png"

  for k, v of res
    res[k] = path + v

  return res
