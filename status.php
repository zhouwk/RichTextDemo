<?php

date_default_timezone_set('PRC');
$status = [];
$status[] = ['name' => '用户' . random_int(10000, 99999), 
			'content' =>'[鼓掌][哭][鼓掌] //@鱼香肉丝鱼呢:#静夜思李白#窗前明月光，玻璃要上爽[哭]//@崔喜师:#哈哈哈哈哈哈#口水流下三千尺，一摸兜里没有钱//@nerd:@me 嗯嗯嗯呃https://www.baidu.com',
			'favour_count' => random_int(100, 999), 
			'comment_count' => random_int(100, 999),
			'repost_count' => random_int(100, 999),
			'like' => 1,
			'time' => time()];
$status[] = ['name' => '用户' . random_int(10000, 99999), 
			'content' =>'[鼓掌] //@用户' .random_int(10000, 99999) . ':#古诗词系列#哈哈哈哈哈哈哈哈哈哈哈哈哈呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵[鼓掌][笑哭]#静夜思李白#窗前明月光，玻璃要上爽[哭]//@:#哈哈哈哈哈哈#口水流下三千尺，一摸兜里没有钱//@nerd:@me 嗯嗯嗯呃https://www.baidu.com',
			'favour_count' => random_int(100, 999), 
			'comment_count' => random_int(100, 999),
			'like' => 0,
			'repost_count' => random_int(100, 999),
			'time' => time() - 1000];
$status[] = ['name' => '用户' . random_int(10000, 99999), 
			'content' =>'[鼓掌] //@高数贼难:#静夜思李白#窗前明月光，玻璃要上爽[哭]//@崔喜师:#哈哈哈哈哈哈#口水流下三千尺，一摸兜里没有钱//@nerd:@me 嗯嗯嗯呃https://www.baidu.com',
			'favour_count' => random_int(100, 999), 
			'comment_count' => random_int(100, 999),
			'repost_count' => random_int(100, 999),
			'like' => 1,
			'time' => time() - 2000];
$status[] = ['name' => '用户' . random_int(10000, 99999), 
			'content' =>'[鼓掌] //@最强躺鸡王:#静夜思李白#窗前明月光，玻璃要上爽[哭]//@崔喜师:#哈哈哈哈哈哈#口水流下三千尺，一摸兜里没有钱//@nerd:@me 嗯嗯嗯呃https://www.baidu.com',
			'favour_count' => random_int(100, 999), 
			'comment_count' => random_int(100, 999),
			'repost_count' => random_int(100, 999),
			'like' => 1,
			'time' => time() - 3000];
$status[] = ['name' => '用户' . random_int(10000, 99999), 
			'content' =>'[鼓掌] //@迷你鸡王:#静夜思李白#窗前明月光，玻璃要上爽[哭]//@崔喜师:#哈哈哈哈哈哈#口水流下三千尺，一摸兜里没有钱//@nerd:@me 嗯嗯嗯呃https://www.baidu.com',
			'favour_count' => random_int(100, 999), 
			'comment_count' => random_int(100, 999),
			'repost_count' => random_int(100, 999),
			'like' => 0,
			'time' => time() - 4000];
$status[] = ['name' => '用户' . random_int(10000, 99999), 
			'content' =>'[鼓掌] //@Ring花椰菜:#静夜思李白#窗前明月光，玻璃要上爽[哭]//@崔喜师:#哈哈哈哈哈哈#口水流下三千尺，一摸兜里没有钱//@nerd:@me 嗯嗯嗯呃https://www.baidu.com',
			'favour_count' => random_int(100, 999), 
			'comment_count' => random_int(100, 999),
			'repost_count' => random_int(100, 999), 
			'like' => 1,
			'time' => time() - 5000];
$json = json_encode($status);
echo "$json";
?>
