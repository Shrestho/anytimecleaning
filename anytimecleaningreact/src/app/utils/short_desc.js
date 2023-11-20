const shortDesc = (desc, length=80)=> {
    if (!desc) return '';
    let str = desc.substring(0, length);
    if (desc.length > length) str = str + '.....';
    return str;
}

export {shortDesc};