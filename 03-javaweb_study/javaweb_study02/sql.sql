-- �������ݿ�
CREATE DATABASE hotel CHARACTER SET utf8;
USE hotel;
-- 1. ������
CREATE TABLE dinnerTable(
   id INT PRIMARY KEY AUTO_INCREMENT,  -- ��������
   tableName VARCHAR(20),	       -- ������
   tableStatus INT DEFAULT 0,          -- ����״̬��0�����У� 1��Ԥ��
   orderDate DATETIME
);


-- 2. ������
CREATE TABLE foodType(
    id INT PRIMARY KEY AUTO_INCREMENT,  -- �������
    typeName VARCHAR(20)		-- �������
);


-- 3. ��Ʒ�ֱ�
CREATE TABLE food(
  id INT PRIMARY KEY AUTO_INCREMENT,  -- ����
  foodName VARCHAR(20),		      -- ������
  foodType_id INT,		      -- ������ϵ, ����ֶ�
  price DOUBLE,			      -- �۸�
  mprice DOUBLE,		      -- ��Ա�۸�
  remark VARCHAR(200),		      -- ���
  img VARCHAR(100) 		      -- ͼƬ
);


-- 4. ������      (����������Ϣ)
CREATE TABLE orders(
   id INT PRIMARY KEY AUTO_INCREMENT,  -- ����
   table_id INT,		       -- ����� �������
   orderDate DATETIME,		       -- �µ�����
   totalPrice DOUBLE,		       -- �������в���Ҫ���ܽ��
   orderStatus INT DEFAULT 0           -- ����״̬�� 0,δ���ˣ� 1,�ѽ���
);

-- 5. ������ϸ��  (��Ҫ�ǲ�Ʒ��)
CREATE TABLE orderDetail(
   id INT PRIMARY KEY AUTO_INCREMENT,  -- ����
   orderId INT,			       -- �����������Ƕ����������
   food_id INT,			       -- ��������õ��ǲ���Ϣ�������
   foodCount INT                       -- �˵�����
   
);


-- ��Ӳ�Ʒ������Ĺ�ϵԼ��
ALTER TABLE food ADD CONSTRAINT fk_food_foodType_id FOREIGN KEY(foodType_id) REFERENCES foodType(id);
-- ������ �������Ĺ�ϵ
ALTER TABLE orders ADD CONSTRAINT order_table_id FOREIGN KEY(table_id) REFERENCES dinnertable(id);
-- ������ϸ�� �붩����Ĺ�ϵ
ALTER TABLE orderDetail ADD CONSTRAINT orderDetail_order_id FOREIGN KEY(orderId) REFERENCES orders(id);
-- ������ϸ�� �����Ϣ�Ĺ�ϵ
ALTER TABLE orderDetail ADD CONSTRAINT orderDetail_food_id FOREIGN KEY(food_id) REFERENCES food(id);
