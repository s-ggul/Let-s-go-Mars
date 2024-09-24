    # 먼저 ITEM_INFO 테이블에서 RARE 인 아이템을 뽑아 데이터를 유지시킴
    # 그 후 해당 RARE아이템 목록에서 ITEM_TREE 테이블 내의 PARENT_ITEM_ID 와 같은 항목들의 ITEM_ID를 따로 테이블로 만듬
    # 마지막으로 다시 ITEM_INFO 테이블에서 해당 정보를 가져옴.
    # 주의 : 여기서 주의할 점은 PARENT_ITEM이 업그레이드되는 아이템이 아니라 업그레이드 되기 직전의 아이템임.
    # 그러니까 다음 업그레이드 하는 아이템은 PARENT_ID에 내 ITEM_ID가 있는지 판단하면 이후 다음 업그레이드 되는 아이템 아이디를 얻을 수 있다는 얘기임.
    SELECT ITEM_INFO.ITEM_ID, ITEM_INFO.ITEM_NAME, ITEM_INFO.RARITY
      FROM (
                SELECT ITEM_TREE.ITEM_ID
                  FROM ITEM_TREE
                      ,(
                          SELECT * 
                            FROM ITEM_INFO
                           WHERE RARITY = 'RARE'
                      ) RARE_ITEM
                  WHERE ITEM_TREE.PARENT_ITEM_ID = RARE_ITEM.ITEM_ID
          ) PARENT_ITEMS, ITEM_INFO
     WHERE PARENT_ITEMS.ITEM_ID = ITEM_INFO.ITEM_ID
  ORDER BY ITEM_INFO.ITEM_ID DESC;